# lyqing的yazi配置

这是一个基于 [Yazi](https://github.com/sxyazi/yazi) 的个人配置文件，集成了多个实用插件，旨在提供高效、美观的终端文件管理体验。

## ✨ 特性概览

- **Git 集成**：在文件管理器中显示 Git 状态。
- **Starship 支持**：集成 Starship 提示符。
- **强大的书签管理**：使用 YAMB 插件进行高效的书签跳转和管理。
- **美化界面**：
  - `yaziline` 提供美观的状态栏。
  - `full-border` 为界面添加全边框。
  - 预览界面最大化切换。
- **智能操作**：
  - `smart-enter`：智能进入目录或打开文件。
  - `compress`：快速压缩文件。
- **高效导航**：集成 `fzf` 和 `zoxide` 进行快速跳转。

## 🧩 插件与快捷键

本配置已预装并配置了以下插件：

### 1. 核心导航与操作
| 快捷键 | 功能 | 插件/命令 |
| :--- | :--- | :--- |
| `l` | 进入目录（默认在unix环境下使用```nvim```，windows环境下使用```code```） | `smart-enter` |
| `T` | 切换最大化预览窗口 | `max-preview` |
| `ca` | 压缩选中的文件 | `compress` |
| `z` | 使用 fzf 跳转文件/目录 | `fzf` |
| `Z` | 使用 zoxide 跳转目录 | `zoxide` |

### 2. 书签管理 (YAMB)
使用 `u` 作为前缀键进行书签操作：

| 快捷键 | 功能 |
| :--- | :--- |
| `ua` | 添加书签 (Add bookmark) |
| `ug` | 按键跳转书签 (Jump by key) |
| `uG` | 使用 fzf 跳转书签 (Jump by fzf) |
| `ud` | 按键删除书签 (Delete by key) |
| `uD` | 使用 fzf 删除书签 (Delete by fzf) |
| `uA` | 删除所有书签 (Delete all) |
| `ur` | 按键重命名书签 (Rename by key) |
| `uR` | 使用 fzf 重命名书签 (Rename by fzf) |

### 3. 界面美化
- **full-border**: 默认启用，为 Yazi 界面添加完整边框。
- **yaziline**: 自定义状态栏样式（圆角风格）。
- **starship**: 集成 Starship 提示符。
- **git**: 显示文件 Git 状态。

## 🚀 安装指南

### 前置要求
确保你的系统已安装以下工具：
- [Yazi](https://yazi-rs.github.io/) (v0.2.5+)
- [fzf](https://github.com/junegunn/fzf)
- [zoxide](https://github.com/ajeetdsouza/zoxide)
- [Starship](https://starship.rs/)
- [Nerd Fonts](https://www.nerdfonts.com/) (推荐，用于图标显示)

### 安装步骤

#### Linux / macOS

1. 备份原有的 Yazi 配置（如果有）：
   ```bash
   mv ~/.config/yazi ~/.config/yazi.bak
   ```

2. 克隆本仓库到配置目录：
   ```bash
   git clone https://github.com/LyQing63/yazi-config.git ~/.config/yazi
   ```
3. 启动 Yazi：
   ```bash
   yazi
   ```

#### Windows

1. 备份原有的 Yazi 配置（如果有）：
   PowerShell:
   ```powershell
   mv $env:APPDATA\yazi\config $env:APPDATA\yazi\config.bak
   ```

2. 克隆本仓库到配置目录：
   ```powershell
   git clone https://github.com/lyqing/yazi-config.git $env:APPDATA\yazi\config
   ```

3. 启动 Yazi。

## 📁 目录结构

- `yazi.toml`: 主配置文件（常规设置）。
- `keymap.toml`: 快捷键配置。
- `theme.toml`: 主题配色。
- `init.lua`: 插件初始化脚本。
- `plugins/`: 包含所有本地安装的插件。
- `flavors/`: 主题文件（如 `ayu-dark`）。
