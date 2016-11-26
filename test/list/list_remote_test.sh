source $(dirname $BASH_SOURCE)/../test_helper.sh

testcase_list_remote() {
  subject shvm list remote
  assert_match '3.2' "$stdout"
}
