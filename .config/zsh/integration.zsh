#!/usr/bin/env zsh

export FZF_COMPLETION_TRIGGER='***'
command -v 'rg' > /dev/null && export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob  "!.git/"'
command -v 'fasd' > /dev/null && eval "$(fasd --init zsh-hook)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


if [ ! -d "$HOME/.tmux/plugins/tpm" ] && command -v git >/dev/null && command -v tmux >/dev/null; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm > /dev/null
fi

j() {
  local dir
  dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m)" && cd "${dir}" || return 1
}



# NVM
# . /usr/share/nvm/init-nvm.sh

# Lazy load node
declare -a NODE_GLOBALS=(`find ~/.nvm/versions/node ~/.yarn -maxdepth 3 -type l -wholename '*/bin/*' | xargs -n1 basename | sort | uniq`)

NODE_GLOBALS+=("node")
NODE_GLOBALS+=("yarn")
NODE_GLOBALS+=("nvm")
NODE_GLOBALS+=("nvim")
NODE_GLOBALS+=("entr")

load_nvm () {
    echo 'Loading nvm'
    export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/zsh_completion" ] && \. "$NVM_DIR/zsh_completion"  # This loads nvm zsh_completion
}

for cmd in "${NODE_GLOBALS[@]}"; do
    eval "${cmd}(){ unset -f ${NODE_GLOBALS}; load_nvm; ${cmd} \$@ }"
done

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

if command -v 'direnv' > /dev/null; then
  _direnv_hook() {
    eval "$("/usr/bin/direnv" export zsh)";
  }
  typeset -ag precmd_functions;
  if [[ -z ${precmd_functions[(r)_direnv_hook]} ]]; then
    precmd_functions+=_direnv_hook;
  fi
fi

export PATH="$PATH:$HOME/.local/bin"

source ~/scripts/jq-zsh-plugin/jq.plugin.zsh
. ~/.config/zsh/keybindings.zsh
