export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

if command -v sway > /dev/null
then
  export _JAVA_AWT_WM_NONREPARENTING=1
fi


export PATH=~/scripts:${PATH}
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin

export PYENV_ROOT=$HOME/.installations/pyenv
export PATH=$PYENV_ROOT/bin:$PATH

##
# Always show root level VM's
export LIBVIRT_DEFAULT_URI='qemu:///system'

source ~/.aliases

if command -v direnv > /dev/null
then
  eval "$(direnv hook zsh)"
fi
