source $(dirname $BASH_SOURCE)/../test_helper.sh

testcase_show_help_when_no_targets() {
  subject shvm list remote
  assert_match 'Usage' "$stdout"
}
