source $(dirname $BASH_SOURCE)/../test_helper.sh

setup() {
  create_bashvm_home
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
