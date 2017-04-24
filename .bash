if [ -z "${SSH_TTY}" ]; then
  xinit ./startkiosk.sh -- -nocursor
fi