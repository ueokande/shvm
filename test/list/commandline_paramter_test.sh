source $(dirname $BASH_SOURCE)/../test_helper.sh

testcase_help() {
  subject bashvm list --help
  assert_match 'Usage' "$stdout"
  assert_equal 0 $status
}

testcase_unrecognized_option() {
  subject bashvm list --sushi
  assert_match 'Unrecognized option' "$stderr"
  assert_equal 1 $status
}

testcase_unrecognized_option() {
  subject bashvm list sushi
  assert_match 'Unrecognized command' "$stderr"
  assert_equal 1 $status
}
