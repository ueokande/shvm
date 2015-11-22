source $(dirname $BASH_SOURCE)/../test_helper.sh

setup() {
  tmpdir=$(mktemp -d)
  export BASHVM_HOME=$tmpdir

  mkdir $BASHVM_HOME/bash-{X.0,X.1,Y.0}/
  mkdir $BASHVM_HOME/bin
  mkdir $BASHVM_HOME/src
  local current_bash_path=$(which bash)
  for dir in $BASHVM_HOME/bash-*; do
    mkdir ${dir}/bin
    ln -s $current_bash_path ${dir}/bin/bash
  done
  ln -s  ../bash-X.1/bin/bash $BASHVM_HOME/bin/bash
}

teardown() {
  rm -rf "$tmpdir"
}

testcase_use_temporary() {
  bashvm use X.0 >/dev/null

  assert_match 'bash-X.0' "$PATH"
  assert_match 'bash-X.0' "$(which bash)"
}

testcase_use_as_default() {
  bashvm use Y.0 --default >/dev/null

  assert_match 'bash-Y.0' "$PATH"
  assert_match 'bash-Y.0' "$(which bash)"
  assert_match 'bash-Y.0' $(readlink $BASHVM_HOME/bin/bash)
}

testcase_use_invalid_version() {
  assert_false bashvm use su.shi
}

testcase_use_with_install() {
  bashvm use 3.2 --install >/dev/null 2>&1
  assert_match 'bash-3.2' "$(which bash)"
}
