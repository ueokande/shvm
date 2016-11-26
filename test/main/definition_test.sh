source $(dirname $BASH_SOURCE)/../test_helper.sh

testcase_shvm_is_function() {
  subject type -t shvm
  assert_match 'function' "$stdout"
}

testcase_invoke_shvm_init() {
  subject $(dirname $BASH_SOURCE)/../../bin/shvm-init
  assert_match 'shvm-init' "$stdout"
  assert_equal 1 $status
}
