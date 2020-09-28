export GO111MODULE=on
# export JAVA_HOME="/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/openjdk-11.0.2.jdk/Contents/Home/"
export PATH=".:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/go/bin:$JAVA_HOME/bin:/usr/local/bin:/usr/bin:/usr/sbin:/bin:/sbin"
export EDITOR=nvim
export PAGER="bat -p"
export MOZ_USE_XINPUT2=1
export LC_TIME=en_US.UTF-8
export SKIM_DEFAULT_COMMAND="fd --type f || git ls-tree -r --name-only HEAD || rg --files || find ."
export FZF_DEFAULT_COMMAND="fd --type f || git ls-tree -r --name-only HEAD || rg --files || find ."
export FZF_DEFAULT_OPTS="--layout=reverse"
export BAT_THEME="Nord"
export TERM=xterm-256color
export CARGO_TARGET_DIR=$HOME/.cargo/target_dir

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
