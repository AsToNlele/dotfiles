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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


export EDITOR='nvim'
export VISUAL='nvim'
export DISABLE_AUTO_TITLE="true"
export AUTO_TITLE=false

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
alias v=vim
alias p=pnpm
alias nvimdiff='nvim -d'


# git lg
git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
# git ci
git config --global alias.ci '!git checkout $(git branch -a | fzf | xargs)'


# bindkey -s "^f" "tmux new ~/scripts/tmux-sessionizer\n"
bindkey -s ^f "tmux-sessionizer\n"


USERNAME="$(whoami)"
# RH Only
if [[ $USERNAME =~ "acelakov" ]];
then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
        export PATH="/home/acelakov/scripts:$PATH"
        export PATH="/home/acelakov/dev/tmux:$PATH"
     
    # IQE
    export DYNACONF_IQE_VAULT_LOADER_ENABLED=true
    export DYNACONF_IQE_VAULT_URL="https://vault.devshift.net/"
    export DYNACONF_IQE_VAULT_VERIFY=true
    export DYNACONF_IQE_VAULT_MOUNT_POINT="insights"
    export DYNACONF_IQE_VAULT_OIDC_AUTH="1"
    
    export PATH="/home/acelakov/scripts:$PATH"
    export PATH="/home/acelakov/dev/tmux:$PATH"
    
    alias cleaninstall="rm -rf node_modules && npm i"
    alias rh="sh ~/rh.sh"
    alias nrs="npm run start:proxy"
    alias nirs="cleaninstall && npm run start:proxy"
    alias nrsb="npm run start:proxy:beta"
    alias nirsb="cleaninstall && npm run start:proxy:beta"
    alias ni="npm i"

    export GOPATH=$HOME/go
    
    # bun
    export BUN_INSTALL="$HOME/.bun"
    export PATH=$BUN_INSTALL/bin:$PATH

    # pnpm
    export PNPM_HOME="/home/acelakov/.local/share/pnpm"
    case ":$PATH:" in
      *":$PNPM_HOME:"*) ;;
      *) export PATH="$PNPM_HOME:$PATH" ;;
    esac

#OSX Only
else
    # pnpm
    export PNPM_HOME="/Users/aston/Library/pnpm"
    case ":$PATH:" in
      *":$PNPM_HOME:"*) ;;
      *) export PATH="$PNPM_HOME:$PATH" ;;
    esac

    # bun completions
    [ -s "/Users/aston/.bun/_bun" ] && source "/Users/aston/.bun/_bun"

    # bun
    export BUN_INSTALL="$HOME/.bun"
    export PATH="$BUN_INSTALL/bin:$PATH"

    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    export PATH="$PYENV_ROOT/shims:${PATH}"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"

    alias pm='python manage.py'
    alias celeryw='celery -A myproject worker --loglevel=INFO'
    alias celeryb='celery -A myproject beat -l info --scheduler django_celery_beat.schedulers:DatabaseScheduler\n'

fi
