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
