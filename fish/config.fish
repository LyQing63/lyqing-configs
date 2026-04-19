fish_add_path /opt/homebrew/bin

if status is-interactive
    # Commands to run in interactive sessions can go here
    # eval (zellij setup --generate-auto-start fish | string collect)
end

# Added by git-ai installer on Sat Feb 21 12:57:11 CST 2026
fish_add_path -g "/Users/qingly/.git-ai/bin"


starship init fish | source

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	command yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end
alias reload "source ~/.config/fish/config.fish"

zoxide init fish | source

fish_config theme choose catppuccin-mocha

function proxy_on
    set -Ux http_proxy http://127.0.0.1:7897
    set -Ux https_proxy http://127.0.0.1:7897
    set -Ux all_proxy socks5://127.0.0.1:7897
    echo "Proxy ON"
end

function proxy_off
    set -eU http_proxy
    set -eU https_proxy
    set -eU all_proxy
    echo "Proxy OFF"
end
set -gx PATH $HOME/.local/bin $PATH
