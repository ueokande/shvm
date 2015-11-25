source $(dirname $BASH_SOURCE)/../test_helper.sh

testcase_show_default_help_by_command() {
  subject bashvm help
  assert_match 'sub-commands' "$stdout"
  assert_equal 0 $status
}

testcase_show_default_help_by_option() {
  subject bashvm --help
  assert_match 'sub-commands' "$stdout"
  assert_equal 0 $status
}

testcase_show_help_of_command() {
  subject bashvm help install
  assert_match 'bashvm install' "$stdout"
  assert_equal 0 $status
}

testcase_show_help_of_help() {
  subject bashvm help help
  assert_match 'bashvm help' "$stdout"
  assert_equal 0 $status
}

testcase_show_help_of_help_by_option() {
  subject bashvm help --help
  assert_match 'bashvm help' "$stdout"
  assert_equal 0 $status
}

testcase_show_default_help_with_invalid_command() {
  subject bashvm help sushi
  assert_match 'sub-commands' "$stdout"
  assert_equal 1 $status
}

testcase_unrecognized_option() {
  subject bashvm help --sushi
  assert_match 'Unrecognized option' "$stderr"
  assert_equal 1 $status
}
