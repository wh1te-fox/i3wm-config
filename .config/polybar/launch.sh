#!/bin/bash

# Cierra instancias anteriores
killall -q polybar

# Espera a que se cierren completamente
while pgrep -x polybar >/dev/null; do sleep 1; done

# Lanza una instancia de polybar por cada monitor detectado por xrandr
if type "xrandr" > /dev/null; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar mybar &
  done
else
  polybar mybar &
fi
