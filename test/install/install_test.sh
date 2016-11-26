source $(dirname $BASH_SOURCE)/../test_helper.sh

testcase_install() {
  subject shvm install 4.0
  assert_true test -d "$SHVM_HOME/usr/bash-4.0"
  assert_equal 0 $status
}

testcase_failed_to_install() {
  subject shvm install su.shi
  assert_equal 1 $status
}
