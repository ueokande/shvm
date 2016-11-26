source $(dirname $BASH_SOURCE)/../test_helper.sh

testcase_help() {
  subject shvm use --help
  assert_match 'Usage' "$stdout"
  assert_equal 0 $status
}

testcase_unrecognized_option() {
  subject shvm use --sushi
  assert_match 'Unrecognized option' "$stderr"
  assert_equal 1 $status
}
