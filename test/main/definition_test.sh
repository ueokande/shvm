source $(dirname $BASH_SOURCE)/../test_helper.sh

testcase_shvm_is_function() {
  subject type -t shvm
  assert_match 'function' "$stdout"
}
