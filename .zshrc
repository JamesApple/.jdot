autoload -U colors && colors

eval "$(fasd --init zsh-hook)"
eval "$(pyenv init -)"


export FZF_COMPLETION_TRIGGER='***'
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob  "!.git/"'


HISTFILE="$HOME/.zsh_history"
HISTSIZE=1000000
SAVEHIST=1000000

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.


fpath=(~/.local/zsh-completions $fpath)
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files.


# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
# bindkey -s '^o' 'lfcd\n'

autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

  setopt COMPLETE_IN_WORD    # Complete from both ends of a word.
  setopt ALWAYS_TO_END       # Move cursor to the end of a completed word.
  setopt PATH_DIRS           # Perform path search even on command names with slashes.
  setopt AUTO_MENU           # Show completion menu on a succesive tab press.
  setopt AUTO_LIST           # Automatically list choices on ambiguous completion.
  setopt AUTO_PARAM_SLASH    # If completed parameter is a directory, add a trailing slash.
  setopt MENU_COMPLETE       # Do autoselect the first completion entry.
  unsetopt FLOW_CONTROL      # Disable start/stop characters in shell editor.

  # Cache completions
  zstyle ':completion:*' accept-exact '*(N)'
  zstyle ':completion:*' use-cache on
  zstyle ':completion:*' cache-path ~/.zsh/cache

  # Treat these characters as part of a word.
  WORDCHARS='*?_-.[]~&;!#$%^(){}<>'

  # Use caching to make completion for cammands such as dpkg and apt usable.
  zstyle ':completion::complete:*' use-cache on
  zstyle ':completion::complete:*' cache-path "$HOME/.zcache"

  # Case-insensitive (all), partial-word, and then substring completion.
  if zstyle -t ':omz:completion:*' case-sensitive; then
    zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
    setopt CASE_GLOB
  else
    zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
    unsetopt CASE_GLOB

  # Group matches and describe.
  zstyle ':completion:*:*:*:*:*' menu select
  zstyle ':completion:*:matches' group 'yes'
  zstyle ':completion:*:options' description 'yes'
  zstyle ':completion:*:options' auto-description '%d'
  zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
  zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
  zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
  zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
  zstyle ':completion:*:default' list-prompt '%S%M matches%s'
  zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
  zstyle ':completion:*' group-name ''
  zstyle ':completion:*' verbose yes

  # Fuzzy match mistyped completions.
  zstyle ':completion:*' completer _complete _match _approximate
  zstyle ':completion:*:match:*' original only
  zstyle ':completion:*:approximate:*' max-errors 1 numeric

  # Increase the number of errors based on the length of the typed word.
  zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'

  # Don't complete unavailable commands.
  zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'

  # Array completion element sorting.
  zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

  # Directories
  zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
  zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
  zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
  zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
  zstyle ':completion:*' squeeze-slashes true

  # History
  zstyle ':completion:*:history-words' stop yes
  zstyle ':completion:*:history-words' remove-all-dups yes
  zstyle ':completion:*:history-words' list false
  zstyle ':completion:*:history-words' menu yes

  # Environmental Variables
  zstyle ':completion::*:(-command-|export):*' fake-parameters ${${${_comps[(I)-value-*]#*,}%%,*}:#-*-}

  # Populate hostname completion.
  zstyle -e ':completion:*:hosts' hosts 'reply=(
  ${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) 2>/dev/null)"}%%[#| ]*}//,/ }
  ${=${(f)"$(cat /etc/hosts(|)(N) <<(ypcat hosts 2>/dev/null))"}%%\#*}
    ${=${${${${(@M)${(f)"$(cat ~/.ssh/config 2>/dev/null)"}:#Host *}#Host }:#*\**}:#*\?*}}
  )'

  # Don't complete uninteresting users...
  zstyle ':completion:*:*:*:users' ignored-patterns \
    adm amanda apache avahi beaglidx bin cacti canna clamav daemon \
    dbus distcache dovecot fax ftp games gdm gkrellmd gopher \
    hacluster haldaemon halt hsqldb ident junkbust ldap lp mail \
    mailman mailnull mldonkey mysql nagios \
    named netdump news nfsnobody nobody nscd ntp nut nx openvpn \
    operator pcap postfix postgres privoxy pulse pvm quagga radvd \
    rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs '_*'

  # ... unless we really want to.
  zstyle '*' single-ignored show

  # Ignore multiple entries.
  zstyle ':completion:*:(rm|kill|diff):*' ignore-line yes
  zstyle ':completion:*:rm:*' file-patterns '*:all-files'

  # Kill
  zstyle ':completion:*:*:*:*:processes' command 'ps -u $USER -o pid,user,comm -w'
  zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;36=0=01'
  zstyle ':completion:*:*:kill:*' menu yes select
  zstyle ':completion:*:*:kill:*' force-list always
  zstyle ':completion:*:*:kill:*' insert-ids single

  # Man
  zstyle ':completion:*:manuals' separate-sections true
  zstyle ':completion:*:manuals.(^1*)' insert-sections true

  # Media Players
  zstyle ':completion:*:*:mpg123:*' file-patterns '*.(mp3|MP3):mp3\ files *(-/):directories'
  zstyle ':completion:*:*:mpg321:*' file-patterns '*.(mp3|MP3):mp3\ files *(-/):directories'
  zstyle ':completion:*:*:ogg123:*' file-patterns '*.(ogg|OGG|flac):ogg\ files *(-/):directories'
  zstyle ':completion:*:*:mocp:*' file-patterns '*.(wav|WAV|mp3|MP3|ogg|OGG|flac):ogg\ files *(-/):directories'

  # Mutt
  if [[ -f ~/.mutt/aliases ]]; then
    zstyle ':completion:*:*:mutt:*' menu yes select
    zstyle ':completion:*:mutt:*' users ${${${(f)"$(<~/.mutt/aliases)"}#alias[[:space:]]}%%[[:space:]]*}
  fi

  # SSH/SCP/RSYNC
  zstyle ':completion:*:(scp|rsync):*' tag-order 'hosts:-host hosts:-domain:domain hosts:-ipaddr:ip\ address *'
  zstyle ':completion:*:(scp|rsync):*' group-order users files all-files hosts-domain hosts-host hosts-ipaddr
  zstyle ':completion:*:ssh:*' tag-order users 'hosts:-host hosts:-domain:domain hosts:-ipaddr:ip\ address *'
  zstyle ':completion:*:ssh:*' group-order hosts-domain hosts-host users hosts-ipaddr
  zstyle ':completion:*:(ssh|scp|rsync):*:hosts-host' ignored-patterns '*.*' loopback localhost
  zstyle ':completion:*:(ssh|scp|rsync):*:hosts-domain' ignored-patterns '<->.<->.<->.<->' '^*.*' '*@*'
  zstyle ':completion:*:(ssh|scp|rsync):*:hosts-ipaddr' ignored-patterns '^<->.<->.<->.<->' '127.0.0.<->'
fi


j() {
  local dir
  dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m)" && cd "${dir}" || return 1
}

zle -N zle-line-init


# --- Colors ---
# (String) => String
function red ()     { print '%F{red}'"$1"'%f'     }
function blue ()    { print '%F{blue}'"$1"'%f'    }
function green ()   { print '%F{green}'"$1"'%f'   }
function cyan ()    { print '%F{cyan}'"$1"'%f'    }
function magenta () { print '%F{magenta}'"$1"'%f' }
function yellow ()  { print '%F{yellow}'"$1"'%f'  }

# --- Helpers ---
function optionally-render-segment-by-count () {
  # SIGNATURE ---
  # Pattern needs to be able to be interpreted by RipGrep as a regular expression
  # [Regex]
  local pattern=$1     # '^[0-9]+ text'
  # Icon can be any string
  # [String]
  local icon=$2        # ''
  # Source text is searched using the pattern attribute
  # [String]
  local source_text=$3 #  '123 text to be searched'
  # Color fn is a string that refers to a function that takes a string and returns a color wrapped string
  # [FunctionRef (String) -> String]
  local color_fn=$4    # 'yellow'
  # => '| 123 '
  # --------------

  if [ -n $source_text ]; then
    local count_from_applying_regex_to_source_text="$(echo $source_text | rg $pattern | wc -l | tr -d '[:space:]')"
    if [ $count_from_applying_regex_to_source_text -ge 1 ]; then
      local colored_icon="$("$color_fn" "$icon")"
      print " | $colored_icon $count_from_applying_regex_to_source_text"
    fi
  fi
}


function update-git-command () {
  # Check if we're not in a git repo
  branch="$( git rev-parse --abbrev-ref HEAD 2&> /dev/null )"
  if [ $? -eq 0 ]; then
    local git_branch_indicator="$(yellow "$branch") "
    # Run full status command
    local latest_git_status="$(git status --porcelain=v2 --branch)"

  fi
}

# Called BEFORE a new line prompt line is written. This will currently insert a newline before the prompt
precmd () { print '' }

function set-prompt () {
  local root_indicator='%(!.@root.)'
  local newline=$'%1(l.\n.)'
  local failure_indicator='%(?..'"$(red '> ')"')'
  PS1="%B$failure_indicator$CURRENT_PATH$( red "$root_indicator" )$( echo ':' )$GIT_SEGMENT%b $newline"
  zle reset-prompt
}

# Called every time a new prompt line is written
zle-line-init () {
  GIT_SEGMENT="$(update-git-command)"
  CURRENT_PATH="$(pwd | sed 's_'"$HOME"'_'"$(blue '~')"'_')"
  set-prompt
}


source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/zsh_completion" ] && \. "$NVM_DIR/zsh_completion"  # This loads nvm zsh_completion

autoload -U +X bashcompinit && bashcompinit
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh



# Experimental copy
function x11-clip-wrap-widgets() {
    # NB: Assume we are the first wrapper and that we only wrap native widgets
    # See zsh-autosuggestions.zsh for a more generic and more robust wrapper
    local copy_or_paste=$1
    shift

    for widget in $@; do
        # Ugh, zsh doesn't have closures
        if [[ $copy_or_paste == "copy" ]]; then
            eval "
            function _x11-clip-wrapped-$widget() {
                zle .$widget
                xclip -in -selection clipboard <<<\$CUTBUFFER
            }
            "
        else
            eval "
            function _x11-clip-wrapped-$widget() {
                CUTBUFFER=\$(xclip -out -selection clipboard)
                zle .$widget
            }
            "
        fi

        zle -N $widget _x11-clip-wrapped-$widget
    done
}


local copy_widgets=(
    vi-yank vi-yank-eol vi-delete vi-backward-kill-word vi-change-whole-line
)
local paste_widgets=(
    vi-put-{before,after}
)

# NB: can atm. only wrap native widgets
x11-clip-wrap-widgets copy $copy_widgets
x11-clip-wrap-widgets paste  $paste_widgets
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
