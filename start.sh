#!/bin/bash

#xinit ./startkiosk.sh -- -nocursor
rm /tmp/.X0-lock &>/dev/null || true
if [ -z "${SSH_TTY}" ]; then
  xinit ./startkiosk.sh -- -nocursor
fi