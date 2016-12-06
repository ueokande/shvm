source $(dirname $BASH_SOURCE)/../test_helper.sh

testcase_build() {
  subject shvm install bash-4.0
  assert_true test -d "$SHVM_HOME/lib/bash-4.0"
  assert_equal 0 $status
}
