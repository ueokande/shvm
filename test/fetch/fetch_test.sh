source $(dirname $BASH_SOURCE)/../test_helper.sh

testcase_fetch_valid_version() {
  subject shvm fetch bash-3.2
  assert_true test -d "$SHVM_HOME/src/bash-3.2"
}

testcase_fetch_invalid_version() {
  assert_false shvm fetch su.shi
}

testcase_exit_when_source_already_exist() {
  subject shvm fetch bash-X.0
  assert_match 'already exists' "$stdout"
}

testcase_fetch_force() {
  mkdir -p $SHVM_HOME/src/bash-4.0
  subject shvm fetch --force bash-4.0
  assert_true test -f "$SHVM_HOME/src/bash-4.0/configure"
}
