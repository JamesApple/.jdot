if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload -U colors && colors

HISTFILE="$HOME/.zsh_history"
HISTSIZE=1000000
SAVEHIST=1000000
setopt ALWAYS_TO_END          # Move cursor to the end of a completed word.
setopt AUTO_LIST              # Automatically list choices on ambiguous completion.
setopt AUTO_MENU              # Show completion menu on a succesive tab press.
setopt AUTO_PARAM_SLASH       # If completed parameter is a directory, add a trailing slash.
setopt BANG_HIST              # Treat the '!' character specially during expansion.
setopt COMPLETE_IN_WORD       # Complete from both ends of a word.
setopt EXTENDED_GLOB
setopt EXTENDED_HISTORY       # Write the history file in the ":start:elapsed;command" format.
setopt HIST_BEEP              # Beep when accessing nonexistent history.
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first when trimming history.
setopt HIST_FIND_NO_DUPS      # Do not display a line previously found.
setopt HIST_IGNORE_ALL_DUPS   # Delete old recorded entry if new entry is a duplicate.
setopt HIST_IGNORE_DUPS       # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_SPACE      # Don't record an entry starting with a space.
setopt HIST_REDUCE_BLANKS     # Remove superfluous blanks before recording entry.
setopt HIST_SAVE_NO_DUPS      # Don't write duplicate entries in the history file.
setopt HIST_VERIFY            # Don't execute immediately upon history expansion.
setopt INC_APPEND_HISTORY     # Write to the history file immediately, not when the shell exits.
setopt INTERACTIVECOMMENTS    # Press # to comment a line in vi mode
setopt MENU_COMPLETE          # Do autoselect the first completion entry.
setopt PATH_DIRS              # Perform path search even on command names with slashes.
setopt SHARE_HISTORY          # Share history between all sessions.
unsetopt FLOW_CONTROL         # Disable start/stop characters in shell editor.

autoload edit-command-line
zle -N edit-command-line

bindkey '^x^e' edit-command-line
bindkey -s '^b' 'cd -\n'

. ~/.config/zsh/integration.zsh
. ~/.config/zsh/completion.zsh


# Archlinux zsh-syntax highlighting. Place as low as possible
[[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
