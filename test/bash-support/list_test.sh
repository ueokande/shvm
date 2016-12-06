source $(dirname $BASH_SOURCE)/../test_helper.sh

testcase_list_bash_support() {
  subject shvm list remote bash
  assert_match '3.2' "$stdout"
  assert_match '4.2' "$stdout"
}
