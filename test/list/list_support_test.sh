source $(dirname $BASH_SOURCE)/../test_helper.sh

testcase_show_supported_shells() {
  mkdir $SHVM_HOME/usr/{wsh,xsh,ysh}-support
  subject shvm list support
  assert_match 'xsh' "$stdout"
  assert_match 'ysh' "$stdout"
  assert_match 'zsh' "$stdout"
  rmdir $SHVM_HOME/usr/{wsh,xsh,ysh}-support
}
