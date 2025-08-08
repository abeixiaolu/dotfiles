eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(fnm env --use-on-cd --shell zsh)"

# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first

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
alias ls="eza --long --all --time-style=long-iso --no-user --git-ignore"
alias lst="eza --long --all --time-style=long-iso --no-user --git-ignore -T"

export GOOGLE_CLOUD_PROJECT=still-summit-464705-b6

[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"

# bun completions
[ -s "/Users/abei/.bun/_bun" ] && source "/Users/abei/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
