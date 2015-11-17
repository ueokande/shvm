source $(dirname $BASH_SOURCE)/../test_helper.sh

setup() {
  tmpdir=$(mktemp -d)
  export BASHVM_HOME=$tmpdir

  mkdir $BASHVM_HOME/src
}

teardown() {
  rm -rf "$tmpdir"
}

testcase_install() {
  subject bashvm install 4.0
  assert_true test -d "$BASHVM_HOME/bash-4.0"
  assert_equal 0 $status
}

testcase_failed_to_install() {
  subject bashvm install su.shi
  assert_equal 1 $status
}
