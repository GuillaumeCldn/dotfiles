
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/guiguiclaudon/Documents/Python/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/guiguiclaudon/Documents/Python/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/guiguiclaudon/Documents/Python/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/guiguiclaudon/Documents/Python/anaconda3/bin:$PATH"
	export MODULAR_HOME="'$HOME'/.modular"
	export PATH="'$MOJO_PATH'/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

#———MODULAR———
export MODULAR_HOME="/Users/guiguiclaudon/.modular"
export PATH="/Users/guiguiclaudon/.modular/pkg/packages.modular.com_mojo/bin:$PATH"

#———Starship———
eval "$(starship init zsh)"

# ———FZF———
source <(fzf --zsh)

alias fnvim='nvim $(fzf --preview="bat --color=always {}")'
alias fmnvim='nvim $(fzf -m --preview="bat --color=always {}")'
alias fzf='fzf --preview="bat --color=always {}"'
alias fzfm='fzf -m --preview="bat --color=always {}"'

# ———FD >> FZF———
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

#———FZF-GIT———
source ~/Documents/GitHub/fzf-git/fzf-git.sh

#———PYENV———
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# ———BAT———
export BAT_THEME="Catppuccin Mocha"

#———EZA———
alias eza="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"

#———THEFUCK———
eval $(thefuck --alias fk)

#———ZOXIDE——— 
eval "$(zoxide init zsh)"


#———BETTER HISTORY MANAGEMENT———
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify
# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

#———ZSH-AUTOSUGGESTIONS———
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

#———ZSH SYNTAX HIGHLIGHTING———
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#———DETAILED LOGGING———
export NVIM_LOG_FILE=~/.local/share/nvim/nvim.log
export NVIM_LOG_LEVEL=debug

#———ATUIN———
eval "$(atuin init zsh)"

# >>> Added by Spyder >>>
alias uninstall-spyder=/Users/guiguiclaudon/Library/spyder-6/uninstall-spyder.sh
# <<< Added by Spyder <<<
