source $(dirname $BASH_SOURCE)/../test_helper.sh

testcase_help_command() {
  subject bashvm help
  assert_match "Usage" "$stdout"
  assert_equal 0 $status
}

testcase_help_option() {
  subject bashvm --help
  assert_match "Usage" "$stdout"
  assert_equal 0 $status
}

testcase_version_option() {
  subject bashvm --version
  assert_match "version" "$stdout"
  assert_equal 0 $status
}

testcase_unrecognized_option() {
  subject bashvm --sushi
  assert_match "Unrecognized option" "$stderr"
  assert_match "--sushi" "$stderr"
  assert_equal 1 $status
}

testcase_unrecognized_command() {
  subject bashvm sushi
  assert_match "Unrecognized command" "$stderr"
  assert_match "sushi" "$stderr"
  assert_equal 1 $status
}
