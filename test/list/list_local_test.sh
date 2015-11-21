source $(dirname $BASH_SOURCE)/../test_helper.sh

setup() {
  tmpdir=$(mktemp -d)
  export BASHVM_HOME=$tmpdir

  mkdir $BASHVM_HOME/bash-{X.0,X.1,Y.0}/
  mkdir $BASHVM_HOME/bin
  for dir in $BASHVM_HOME/bash-*; do
    mkdir ${dir}/bin
    ln -s /usr/bin/bash ${dir}/bin/bash
  done
  ln -s  ../bash-X.1/bin/bash $BASHVM_HOME/bin/bash
}

teardown() {
  rm -rf "$tmpdir"
}

testcase_show_list_in_local() {
  subject bashvm list local
  assert_match 'X.0' "$stdout"
  assert_match 'X.1' "$stdout"
  assert_match 'Y.0' "$stdout"
}

testcase_show_default_bashtub() {
  subject bashvm list local
  assert_match '\* bash-X.1' "$stdout"
}

testcase_show_default_bashtub() {
  PATH="$BASHVM_HOME/bash-Y.0/bin:$PATH" subject bashvm list local
  assert_match '=> bash-Y.0' "$stdout"
}

testcase_show_curren_and_default_bashtub() {
  PATH="$BASHVM_HOME/bash-X.1/bin:$PATH" subject bashvm list local
  assert_match '=\* bash-X.1' "$stdout"
}
