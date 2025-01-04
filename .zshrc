# zmodload zsh/zpro
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'
export VISUAL='nvim'
export DISABLE_AUTO_TITLE="true"
export AUTO_TITLE=false
export LANG=en_US.UTF-8
export HUSKY=0
export PATH="/Users/acelakov/scripts:$PATH"
export PATH="/Users/acelakov/dev/tmux:$PATH"

alias vim=nvim
alias v=nvim
alias lla='ls -la'
alias cr='code . -r'
alias c.='code .'
alias glg='git lg'
alias gc-='git checkout -'
alias gci="git ci"
alias gti="sl"
alias grc='gh repo clone'
alias gpc="gh pr checkout"
alias ta='tmux attach'
alias td='tmux detach'
alias vimconf='cd ~/.config/nvim && nvim'
alias zshconf='vim ~/.zshrc && source ~/.zshrc'
alias tmuxconf='vim ~/.tmux.conf && tmux source ~/.tmux.conf'
alias v=vim
alias p=pnpm
alias nvimdiff='nvim -d'
alias kkill='sudo kill -9'
alias grep='ggrep'
alias podman-compose='podman compose'
alias docker=podman
alias fastfetch="fastfetch --config examples/7.jsonc --kitty ~/.config/fastfetch/e36.png" 
alias firefox="open -a Firefox\ Developer\ Edition"
alias beep="afplay /System/Library/Sounds/Blow.aiff -v 5"
alias pc="podman compose"
alias nr="npm run"
alias ls="lsd"

alias cleaninstall="rm -rf node_modules && npm i"
alias rh="sh ~/rh.sh"
alias nrs="npm run start:proxy"
alias nirs="cleaninstall && npm run start:proxy"
alias nrsb="npm run start:proxy:beta"
alias nirsb="cleaninstall && npm run start:proxy:beta"
alias ni="npm i"
alias ns="npm start"
alias nsp="npm run start:proxy"
alias nisp="cleaninstall && nsp"
alias nspp="PROXY=true npx fec dev --clouddotEnv stage"
alias nispp="cleaninstall && nspp"

# git lg
git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
# git ci
git config --global alias.ci '!git checkout $(git branch -a | fzf | xargs)'


bindkey -s ^f "tmux-sessionizer\n"

# pyenv, slow af
# eval "$(pyenv init -)"
# if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# pnpm
export PNPM_HOME="/Users/acelakov/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
if [ -d "/opt/homebrew/opt/ruby/bin" ]; then
  export PATH=/opt/homebrew/opt/ruby/bin:$PATH
  export PATH=`gem environment gemdir`/bin:$PATH
fi

if [ -d "/opt/homebrew/Cellar/sfml" ]; then
 export SFML_INCLUDE_DIR="/opt/homebrew/Cellar/sfml/2.6.1/include"
 export SFML_LIBS_DIR="/opt/homebrew/Cellar/sfml/2.6.1/lib"
fi

# Add go
export PATH="$HOME/go/bin:$PATH"

# Add dart 
export PATH="$PATH":"$HOME/.pub-cache/bin"

# PGSQL client
export PATH="$PATH":"/opt/homebrew/Cellar/libpq/17.1/bin"


# Bonfire setup
VENV_DIR=~/bonfire_venv
# Enable bonfire
# . $VENV_DIR/bin/activate

# Yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

curl_time() {
    curl -so /dev/null -w "\
   namelookup:  %{time_namelookup}s\n\
      connect:  %{time_connect}s\n\
   appconnect:  %{time_appconnect}s\n\
  pretransfer:  %{time_pretransfer}s\n\
     redirect:  %{time_redirect}s\n\
starttransfer:  %{time_starttransfer}s\n\
-------------------------\n\
        total:  %{time_total}s\n" "$@"
}


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# zprof
