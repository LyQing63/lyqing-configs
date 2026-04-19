#!/usr/bin/env bash
#
# 一键搭建 kitty + fish + yazi + nvim 开发环境
# 通过 Homebrew 安装所有依赖，并将 ../<tool>/ 配置软链到 ~/.config 下
#
# 用法：
#   chmod +x install.sh
#   ./install.sh

set -euo pipefail

# ---------------------------------------------------------------------------
# 路径与常量
# ---------------------------------------------------------------------------
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_SRC_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"   # 上一级目录 == ~/.config
CONFIG_DIR="${HOME}/.config"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m'

info()    { echo -e "${GREEN}[INFO]${NC} $*"; }
warn()    { echo -e "${YELLOW}[WARN]${NC} $*"; }
error()   { echo -e "${RED}[ERROR]${NC} $*" >&2; }
section() { echo -e "\n${BLUE}==>${NC} ${1}"; }

# ---------------------------------------------------------------------------
# 1. Homebrew 检查
# ---------------------------------------------------------------------------
check_homebrew() {
    section "检查 Homebrew"
    if ! command -v brew >/dev/null 2>&1; then
        error "未检测到 Homebrew，请先安装："
        echo '  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
        exit 1
    fi
    info "Homebrew 已就位：$(brew --version | head -1)"
}

# ---------------------------------------------------------------------------
# 2. brew 安装辅助
# ---------------------------------------------------------------------------
brew_install() {
    local pkg="$1"
    if brew list --formula "$pkg" >/dev/null 2>&1; then
        info "已安装（formula）：$pkg"
    else
        info "正在安装 formula：$pkg"
        brew install "$pkg"
    fi
}

brew_install_cask() {
    local pkg="$1"
    if brew list --cask "$pkg" >/dev/null 2>&1; then
        info "已安装（cask）：$pkg"
    else
        info "正在安装 cask：$pkg"
        brew install --cask "$pkg"
    fi
}

# ---------------------------------------------------------------------------
# 3. 安装清单
# ---------------------------------------------------------------------------

# 核心组件
CORE_FORMULAE=(
    fish        # shell
    neovim      # 编辑器
    yazi        # TUI 文件管理器
    tmux        # mars.nvim 同时安装 tmux 配置
    git
)

# kitty 通过 cask 安装
CORE_CASKS=(
    kitty
)

# fish 配置中引用的工具：starship / zoxide / fzf（fzf.fish 插件）/ fisher
FISH_TOOLS=(
    starship
    zoxide
    fzf
)

# yazi 推荐依赖（覆盖图片/视频/PDF/字体/归档/Markdown 预览等）
# 参考 ../yazi/yazi.toml previewers / openers，以及 plugins/glow.yazi
YAZI_DEPS=(
    ffmpeg          # 视频帧
    sevenzip        # 归档
    jq              # JSON 预览
    poppler         # PDF
    fd              # 查找
    ripgrep         # 搜索（同时给 telescope 用）
    imagemagick     # avif/heic/jxl 等图片格式
    resvg           # SVG 渲染
    glow            # Markdown 预览（init.lua / yazi.toml 显式引用）
    exiftool        # 文件元数据
    mediainfo       # 媒体信息
    mpv             # 音视频播放
)

# nvim 相关：LSP / treesitter / 调试 / Go 插件
NVIM_DEPS=(
    node            # 大量 LSP / formatter 依赖 npm
    tree-sitter
    lazygit         # neogit / git 工作流配套
    go              # mars/plugins/go.lua 需要 go 工具链
    delve           # mars/plugins/debug.lua ensure_installed = { 'delve' }
)

# 字体：kitty.conf 指定 Fira Code，nvim 大量图标需要 Nerd Font
FONT_CASKS=(
    font-fira-code
    font-fira-code-nerd-font
    font-symbols-only-nerd-font
)

# ---------------------------------------------------------------------------
# 4. 备份与软链
# ---------------------------------------------------------------------------
backup_if_exists() {
    local target="$1"
    if [ -e "$target" ] || [ -L "$target" ]; then
        local backup="${target}.backup.$(date +%Y%m%d%H%M%S)"
        warn "备份已存在的 $target -> $backup"
        mv "$target" "$backup"
    fi
}

create_symlink() {
    local source="$1"
    local target="$2"
    if [ ! -e "$source" ]; then
        warn "源不存在，跳过：$source"
        return
    fi
    backup_if_exists "$target"
    ln -s "$source" "$target"
    info "软链已建立：$target -> $source"
}

# ---------------------------------------------------------------------------
# 5. fisher 与 fish 插件
# ---------------------------------------------------------------------------
install_fisher_plugins() {
    section "安装 fisher 及 fish_plugins 中的插件"
    local fish_bin
    fish_bin="$(command -v fish || true)"
    if [ -z "$fish_bin" ]; then
        warn "fish 不在 PATH 中，跳过 fisher 安装"
        return
    fi

    # 安装 fisher
    "$fish_bin" -c '
        if not functions -q fisher
            curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
            and fisher install jorgebucaran/fisher
        end
    ' || warn "fisher 安装失败（可能离线）"

    # 安装 fish_plugins 列出的插件
    if [ -f "${CONFIG_SRC_DIR}/fish/fish_plugins" ]; then
        "$fish_bin" -c 'fisher update' || warn "fisher update 失败"
    fi
}

# ---------------------------------------------------------------------------
# 6. 设置默认 shell
# ---------------------------------------------------------------------------
maybe_set_default_shell() {
    section "可选：将 fish 设为默认 shell"
    local fish_bin="/opt/homebrew/bin/fish"
    if [ ! -x "$fish_bin" ]; then
        fish_bin="$(command -v fish || true)"
    fi
    if [ -z "$fish_bin" ] || [ ! -x "$fish_bin" ]; then
        warn "找不到可执行的 fish，跳过"
        return
    fi

    if ! grep -qx "$fish_bin" /etc/shells; then
        warn "需要将 $fish_bin 加入 /etc/shells（需要 sudo）"
        echo "  执行：echo $fish_bin | sudo tee -a /etc/shells"
    fi
    echo "  执行：chsh -s $fish_bin"
}

# ---------------------------------------------------------------------------
# main
# ---------------------------------------------------------------------------
main() {
    info "源目录：${CONFIG_SRC_DIR}"
    info "目标目录：${CONFIG_DIR}"
    mkdir -p "$CONFIG_DIR"

    check_homebrew

    section "更新 Homebrew 索引"
    brew update >/dev/null || warn "brew update 失败，继续"

    section "安装核心组件"
    for f in "${CORE_FORMULAE[@]}"; do brew_install "$f"; done
    for c in "${CORE_CASKS[@]}"; do brew_install_cask "$c"; done

    section "安装 fish 配置依赖"
    for f in "${FISH_TOOLS[@]}"; do brew_install "$f"; done

    section "安装 yazi 推荐依赖"
    for f in "${YAZI_DEPS[@]}"; do brew_install "$f"; done

    section "安装 nvim 相关依赖"
    for f in "${NVIM_DEPS[@]}"; do brew_install "$f"; done

    section "安装字体"
    for c in "${FONT_CASKS[@]}"; do brew_install_cask "$c"; done

    section "建立配置软链接"
    create_symlink "${CONFIG_SRC_DIR}/kitty"        "${CONFIG_DIR}/kitty"
    create_symlink "${CONFIG_SRC_DIR}/fish"         "${CONFIG_DIR}/fish"
    create_symlink "${CONFIG_SRC_DIR}/yazi"         "${CONFIG_DIR}/yazi"
    create_symlink "${CONFIG_SRC_DIR}/starship.toml" "${CONFIG_DIR}/starship.toml"
    # nvim 配置位于 mars.nvim/nvim
    create_symlink "${CONFIG_SRC_DIR}/mars.nvim/nvim" "${CONFIG_DIR}/nvim"
    # tmux 来自 mars.nvim/tmux/tmux.conf
    mkdir -p "${CONFIG_DIR}/tmux"
    create_symlink "${CONFIG_SRC_DIR}/mars.nvim/tmux/tmux.conf" "${CONFIG_DIR}/tmux/tmux.conf"

    install_fisher_plugins

    section "同步 yazi 插件依赖（ya pkg）"
    if command -v ya >/dev/null 2>&1; then
        ya pkg upgrade || warn "ya pkg upgrade 失败"
    else
        warn "未找到 ya（yazi 自带），跳过插件同步"
    fi

    section "首次启动 nvim 触发 lazy.nvim 同步插件"
    if command -v nvim >/dev/null 2>&1; then
        nvim --headless "+Lazy! sync" +qa || warn "nvim Lazy sync 失败，可手动 :Lazy sync"
    fi

    maybe_set_default_shell

    section "全部完成"
    cat <<'EOF'

下一步建议：
  1. 重新登录或执行 `exec fish` 加载新 shell
  2. 打开 kitty 验证字体与配色
  3. 在 nvim 中执行 `:checkhealth` 检查依赖
  4. 在 yazi 中按 `~` 查看快捷键，或运行 `ya pkg list`

EOF
}

main "$@"
