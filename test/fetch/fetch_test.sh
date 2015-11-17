source $(dirname $BASH_SOURCE)/../test_helper.sh

setup() {
  tmpdir=$(mktemp -d)
  mkdir $tmpdir/src
}

teardown() {
  rm -rf "$tmpdir"
}

testcase_fetch_valid_version() {
  BASHVM_HOME=$tmpdir subject bashvm fetch 3.2
  assert_true test -d "$tmpdir/src/bash-3.2"
}

testcase_fetch_invalid_version() {
  BASHVM_HOME=$tmpdir assert_false bashvm fetch su.shi
}

testcase_exit_when_source_already_exist() {
  mkdir -p $BASHVM_HOME/src/bash-9.9
  subject bashvm fetch 9.9
  assert_match 'already exists' "$stdout"
}
