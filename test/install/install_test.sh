source $(dirname $BASH_SOURCE)/../test_helper.sh

testcase_install() {
  subject shvm install bash-4.0
  assert_true test -d "$SHVM_HOME/lib/bash-4.0"
  assert_equal 0 $status
}

testcase_failed_to_install() {
  subject shvm install su.shi
  assert_equal 1 $status
}
