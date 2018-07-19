#!/usr/bin/env sh
MONITORS="$(xrandr --query)"
PRIM_MONITOR=$(echo "$MONITORS" | \
	grep " connected" | \
	grep "primary" | \
	cut -d" " -f1)
SECND_MONITORS=$(echo "$MONITORS" | \
	grep " connected" | \
	grep -v "primary" | \
	cut -d" " -f1)

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

MONITOR=$PRIM_MONITOR polybar primary &
for m in $SECND_MONITORS; do
    MONITOR=$m polybar simple &
 #MONITOR=$m polybar primary &
done

# Launch bar1 and bar2
#polybar top &
#polybar bar2 &

echo "Bars launched..."
