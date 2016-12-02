
before_each() {
  tmpdir=$(mktemp -d)
  export SHVM_HOME=$tmpdir
  export SHVM_DEFAULT_VERSION="bash-X.1"

  mkdir -p $SHVM_HOME/usr/bash-{X.0,X.1,Y.0}
  mkdir -p $SHVM_HOME/src/bash-X.0
  ln -s $(readlink -f $(dirname $BASH_SOURCE)/../bin) $SHVM_HOME/bin
  cp -r $(readlink -f $(dirname $BASH_SOURCE)/../usr/shvm-core) $SHVM_HOME/usr
  local current_bash_path=$(which bash)
  for dir in $SHVM_HOME/usr/bash-*; do
    mkdir ${dir}/bin
    ln -s $current_bash_path ${dir}/bin/bash
  done

  source ${SHVM_HOME}/bin/shvm-init
}

after_each() {
  rm -rf $tmpdir
}
