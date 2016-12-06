source $(dirname $BASH_SOURCE)/../test_helper.sh

testcase_failed_to_install() {
  subject shvm install su.shi
  assert_equal 1 $status
}
