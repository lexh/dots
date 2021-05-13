# zsh basic
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(
  git
  kubectl
  zsh-autosuggestions
  history-substring-search
)
source $ZSH/oh-my-zsh.sh

# vi mode
bindkey -v
export KEYTIMEOUT=1

# history
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt BANG_HIST              # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY       # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY     # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY          # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS       # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS   # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS      # Do not display a line previously found.
setopt HIST_IGNORE_SPACE      # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS      # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS     # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY            # Don't execute immediately upon history expansion.
setopt HIST_BEEP              # Beep when accessing nonexistent history.
export HISTORY_IGNORE="(ls|ll|la|pwd|exit|clear|clr|h *|history)"

# history search: filter history by sequence of optional regular expressions
h() {
    if [ -z "$*" ]; then
        history;
    else
        res=$(history)
        for arg in "$@"; do
            res=$(echo $res | egrep $arg | grep -v " h ")
        done;
    echo $res
    fi;
}

# pretty branch diff: bdiff <base> <compare>
bdiff() {
    git log --graph --pretty=format:'%Cred%h%Creset (%ae) -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative $1..$2
}

# pid helpers
p() { ps aux | egrep -v egrep | GREP_COLOR='01;34' egrep --color=always -i "$@"; }
pid() { p "$@" | sed -E 's/ +/ /g' | cut -d ' ' -f2 }

bindkey '^[OA' history-substring-search-up
bindkey '^[OB' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

alias -g :q=exit

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/lherbert/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/lherbert/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/lherbert/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/lherbert/google-cloud-sdk/completion.zsh.inc'; fi

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'

[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

export PATH=${PATH}:${HOME}/ltools

# man pages for built-ins
unalias run-help 2> /dev/null
autoload run-help

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

alias gj="cd ~/git/java"
