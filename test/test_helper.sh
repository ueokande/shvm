source $(dirname $BASH_SOURCE)/../bin/bashvm-init

create_bashvm_home() {
  tmpdir=$(mktemp -d)
  export BASHVM_HOME=$tmpdir

  mkdir -p $BASHVM_HOME/bash-{X.0,X.1,Y.0}
  mkdir -p $BASHVM_HOME/src/bash-X.0
  mkdir $BASHVM_HOME/bin
  local current_bash_path=$(which bash)
  for dir in $BASHVM_HOME/bash-*; do
    mkdir ${dir}/bin
    ln -s $current_bash_path ${dir}/bin/bash
  done
  ln -s  ../bash-X.1/bin/bash $BASHVM_HOME/bin/bash
}
