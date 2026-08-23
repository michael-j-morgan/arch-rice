function lastpaclog() {
  less "$(ls -t ~/pacman-logs/pacman-syu-*.log | head -n1)"
}

pacdo() {
  mkdir -p ~/pacman-logs
  local timestamp=$(date +%F_%H-%M-%S)
  local action=$1
  shift

  case "$action" in
    install)
      if [ $# -eq 0 ]; then echo "Usage: pacdo install <package(s)>"; return 1; fi
      sudo pacman -S "$@" 2>&1 | tee ~/pacman-logs/install-"$*"-"$timestamp".log
      ;;
    remove)
      if [ $# -eq 0 ]; then echo "Usage: pacdo remove <package(s)>"; return 1; fi
      sudo pacman -R "$@" 2>&1 | tee ~/pacman-logs/remove-"$*"-"$timestamp".log
      ;;
    log)
      sudo pacman -Syu 2>&1 | tee ~/pacman-logs/pacman-syu-"$timestamp".log
      ;;
    info)
      if [ $# -eq 0 ]; then echo "Usage: pacdo info <package(s)>"; return 1; fi
      pacman -Qi "$@" 2>&1 | tee ~/pacman-logs/info-"$*"-"$timestamp".log
      ;;
    *)
      echo "Usage: pacdo {install|remove|log|info} [...]"
      return 1
      ;;
  esac
}

pacinst() {
  mkdir -p ~/pacman-logs
  local timestamp=$(date +%F_%H-%M-%S)
  sudo pacman -S "$@" 2>&1 | tee ~/pacman-logs/install-"$*"-"$timestamp".log
}

paclog() {
  mkdir -p ~/pacman-logs
  local timestamp=$(date +%F_%H-%M-%S)
  sudo pacman -Syu 2>&1 | tee ~/pacman-logs/pacman-syu-"$timestamp".log
}

pacrm() {
  if [ -z "$1" ]; then
    echo "Usage: pacrm <package-name>"
    return 1
  fi
  mkdir -p ~/pacman-logs
  local timestamp=$(date +%F_%H-%M-%S)
  sudo pacman -R "$@" 2>&1 | tee ~/pacman-logs/remove-"$*"-"$timestamp".log
}

pacinfo() {
  mkdir -p ~/pacman-logs
  local timestamp=$(date +%F_%H-%M-%S)
  pacman -Qi "$@" 2>&1 | tee ~/pacman-logs/info-"$*"-"$timestamp".log
}
