source $(dirname $BASH_SOURCE)/../test_helper.sh

testcase_use_temporary() {
  bashvm use X.0 >/dev/null

  assert_match 'bash-X.0' "$PATH"
  assert_match 'bash-X.0' "$(which bash)"
}

testcase_use_as_default() {
  bashvm use Y.0 --default >/dev/null

  assert_match 'bash-Y.0' "$PATH"
  assert_match 'bash-Y.0' "$(which bash)"
}

testcase_use_invalid_version() {
  assert_false bashvm use su.shi
}

testcase_use_with_install() {
  bashvm use 3.2 --install >/dev/null 2>&1
  assert_match 'bash-3.2' "$(which bash)"
}
