source $(dirname $BASH_SOURCE)/../test_helper.sh

testcase_show_list_in_local() {
  subject shvm list local
  assert_match 'X.0' "$stdout"
  assert_match 'X.1' "$stdout"
  assert_match 'Y.0' "$stdout"
}

testcase_show_default_bashtub() {
  subject shvm list local
  assert_match '\* bash-X.1' "$stdout"
}

testcase_show_curren_and_default_bashtub() {
  PATH="$SHVM_HOME/lib/bash-X.1/bin:$PATH" subject shvm list local
  assert_match '=\* bash-X.1' "$stdout"
}
