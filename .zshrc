eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(fnm env --use-on-cd --shell zsh)"
# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first

# 启用自动补全系统
autoload -Uz compinit
compinit

# autosuggestions and syntax highlighting
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# pnpm
export PNPM_HOME="/Users/abei/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# alias
alias cd="z"
alias d="nr dev"
alias d="nr dev"
alias dd="nr docs:dev"
alias b="nr build"
alias bz="rm -rf dist && rm -rf dist.zip && nr build:test && zip -r dist.zip dist"
alias ws="cd ~/Documents/workspace"
alias i="cd ~/Documents/i"
alias f="cd ~/Documents/f"
alias gaa="git add ."
alias gcvm="git commit --no-verify -m"
alias gcm="git commit -m"
alias gpl="git pull"
alias gps="git push"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gst="git status"
alias gs="git switch"
alias gstash="git stash"
alias gpop="git stash pop"
alias gsd="git switch daily"
alias gsr="git switch release"
alias gsm="git switch master"
alias ls="eza --all -l --color=always --time-style=long-iso --no-user -h --icons=always --group-directories-first"
alias lst="eza --long --all --time-style=long-iso --no-user --git-ignore -T"
alias codex='codex --dangerously-bypass-approvals-and-sandbox'
alias claude='claude --dangerously-skip-permissions'
# 快速创建 hotfix/时间分支
alias hotfix='git checkout -b hotfix/$(date +%Y%m%d-%H%M%S)'
alias cat='bat'

# bun completions
[ -s "/Users/abei/.bun/_bun" ] && source "/Users/abei/.bun/_bun"
# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

tmux-install() {
  if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    echo "🔧 正在安装 TPM..."
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  else
    echo "✅ TPM 已存在"
  fi

  # 检查 tmux 是否已安装
  if ! command -v tmux >/dev/null 2>&1; then
    echo "❌ 未检测到 tmux，请先安装 tmux"
    return 1
  fi

  echo "🚀 正在安装 tmux 插件..."
  tmux new -d -s setup "sleep 1; ~/.tmux/plugins/tpm/bin/install_plugins; tmux kill-session -t setup" >/dev/null 2>&1

  echo "✨ 插件安装完成！"
  echo "提示：打开 tmux 后可用 prefix + U 更新插件。"
}


export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export PATH="$JAVA_HOME/bin:$PATH"

# >>> otty shell integration >>>
# Added by Otty — toggle in Settings > Shell > Shell Integration.
# Inert unless launched by Otty (it sets $OTTY_SHELL_INTEGRATION).
if [ -n "$OTTY_SHELL_INTEGRATION" ] && [ -r "$OTTY_SHELL_INTEGRATION/otty-integration.zsh" ]; then
  . "$OTTY_SHELL_INTEGRATION/otty-integration.zsh"
fi
# <<< otty shell integration <<<
