source $(dirname $BASH_SOURCE)/../test_helper.sh

testcase_uninstall_installed_version() {
  mkdir $SHVM_HOME/lib/bash-X.Y
  subject shvm uninstall bash-X.Y
  assert_false test -d "$SHVM_HOME/lib/bash-X.Y"
}

testcase_uninstall_gone_version() {
  subject shvm uninstall su.shi
  assert_match "gone" "$stdout"
  assert_equal 1 $status
}
