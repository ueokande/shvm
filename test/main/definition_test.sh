source $(dirname $BASH_SOURCE)/../test_helper.sh

testcase_bashvm_is_function() {
  subject type -t bashvm
  assert_match 'function' "$stdout"
}

testcase_invoke_bashvm_init() {
  subject $(dirname $BASH_SOURCE)/../../bin/bashvm-init
  assert_match 'bashvm-init' "$stdout"
  assert_equal 1 $status
}
