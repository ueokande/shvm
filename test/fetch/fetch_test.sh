source $(dirname $BASH_SOURCE)/../test_helper.sh

testcase_fetch_valid_version() {
  subject bashvm fetch 3.2
  assert_true test -d "$BASHVM_HOME/src/bash-3.2"
}

testcase_fetch_invalid_version() {
  assert_false bashvm fetch su.shi
}

testcase_exit_when_source_already_exist() {
  subject bashvm fetch X.0
  assert_match 'already exists' "$stdout"
}

testcase_fetch_force() {
  mkdir -p $BASHVM_HOME/src/bash-4.0
  subject bashvm fetch --force 4.0
  assert_true test -f "$BASHVM_HOME/src/bash-4.0/configure"
}
