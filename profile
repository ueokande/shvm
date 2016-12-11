shvm_use() {
  install=
  target=

  while test $# != 0; do
    case "$1" in
    --help)
      "$SHVM_HOME/usr/shvm-use" --help
      return 0
      ;;
    --install)
      install=t
      ;;
    -*|--*)
      echo "Unrecognized option: $1" >&2
      return 1
      ;;
    *)
      target="$1"
      ;;
    esac
    shift
  done

  if [ -z "$target" ]; then
    "$SHVM_HOME/usr/shvm-use" --help
    return 1
  fi

  [ -n "$install" ] && "$SHVM_HOME/usr/shvm-install" "$target"

  if ! [ -d "$SHVM_HOME/lib/$target" ]; then
    echo "Unknown shell version: $target." >&2
    return 1
  fi

  export PATH="$SHVM_HOME/lib/$target/bin:$PATH"

  echo "Switched to $target"
}
export -f shvm_use

shvm() {
  case "$1" in
  list)
    shift
    "$SHVM_HOME/usr/shvm-list" "$@"
    ;;
  use)
    shift
    shvm_use "$@"
    ;;
  fetch)
    shift
    "$SHVM_HOME/usr/shvm-fetch" "$@"
    ;;
  install)
    shift
    "$SHVM_HOME/usr/shvm-install" "$@"
    ;;
  uninstall)
    shift
    "$SHVM_HOME/usr/shvm-uninstall" "$@"
    ;;
  help)
    shift
    "$SHVM_HOME/usr/shvm-help" "$@"
    ;;
  --help)
    shift
    "$SHVM_HOME/usr/shvm-help"
    ;;
  --version)
    shift
    echo "shvm version 0.0.0"
    ;;
  -*|--*)
    echo "Unrecognized option: $1" >&2
    return 1
    ;;
  *)
    echo "Unrecognized command: $1" >&2
    return 1
    ;;
  esac
}
export -f shvm

export SHVM_HOME=${SHVM_HOME:-$HOME/.shvm}
