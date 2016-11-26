source $(dirname $BASH_SOURCE)/../test_helper.sh

testcase_uninstall_installed_version() {
  mkdir $SHVM_HOME/usr/bash-X.Y
  subject shvm uninstall X.Y
  assert_false test -d "$SHVM_HOME/usr/bash-X.Y"
}

testcase_uninstall_gone_version() {
  subject shvm uninstall su.shi
  assert_match "gone" "$stdout"
  assert_equal 1 $status
}
