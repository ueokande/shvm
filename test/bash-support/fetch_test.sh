source $(dirname $BASH_SOURCE)/../test_helper.sh

testcase_fetch_valid_version() {
  subject shvm fetch bash-3.2
  assert_true test -d "$SHVM_HOME/src/bash-3.2"
}

