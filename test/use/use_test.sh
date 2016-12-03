source $(dirname $BASH_SOURCE)/../test_helper.sh

testcase_use_temporary() {
  shvm use bash-X.0 >/dev/null

  assert_match 'bash-X.0' "$PATH"
  assert_match 'bash-X.0' "$(which bash)"
}

testcase_use_invalid_version() {
  assert_false shvm use su.shi
}

testcase_use_with_install() {
  shvm use bash-3.2 --install >/dev/null 2>&1
  assert_match 'bash-3.2' "$(which bash)"
}
