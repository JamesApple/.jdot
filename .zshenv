export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export PATH=~/.local/tools:${PATH}
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin

##
# Always show root level VM's
export LIBVIRT_DEFAULT_URI='qemu:///system'

source ~/.aliases
