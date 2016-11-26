source $(dirname $BASH_SOURCE)/../test_helper.sh

testcase_show_default_help_by_command() {
  subject shvm help
  assert_match 'sub-commands' "$stdout"
  assert_equal 0 $status
}

testcase_show_default_help_by_option() {
  subject shvm --help
  assert_match 'sub-commands' "$stdout"
  assert_equal 0 $status
}

testcase_show_help_of_command() {
  subject shvm help install
  assert_match 'shvm install' "$stdout"
  assert_equal 0 $status
}

testcase_show_help_of_help() {
  subject shvm help help
  assert_match 'shvm help' "$stdout"
  assert_equal 0 $status
}

testcase_show_help_of_help_by_option() {
  subject shvm help --help
  assert_match 'shvm help' "$stdout"
  assert_equal 0 $status
}

testcase_show_default_help_with_invalid_command() {
  subject shvm help sushi
  assert_match 'sub-commands' "$stdout"
  assert_equal 1 $status
}

testcase_unrecognized_option() {
  subject shvm help --sushi
  assert_match 'Unrecognized option' "$stderr"
  assert_equal 1 $status
}
