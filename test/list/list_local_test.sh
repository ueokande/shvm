source $(dirname $BASH_SOURCE)/../test_helper.sh

setup() {
  create_bashvm_home
}

testcase_show_list_in_local() {
  subject bashvm list local
  assert_match 'X.0' "$stdout"
  assert_match 'X.1' "$stdout"
  assert_match 'Y.0' "$stdout"
}

testcase_show_default_bashtub() {
  subject bashvm list local
  assert_match '\* bash-X.1' "$stdout"
}

testcase_show_curren_and_default_bashtub() {
  PATH="$BASHVM_HOME/bash-X.1/bin:$PATH" subject bashvm list local
  assert_match '=\* bash-X.1' "$stdout"
}
