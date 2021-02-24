#if [ $(pactl list sources | grep Mute | awk '{print $2}' | head -n 1) == "no" ]; then
#	echo -n "🎤  "
#else
#	echo -n "❌  "
#fi
if [ $(pactl list sinks | grep Mute | awk '{print $2}' ) == "no" ]; then
	echo $(pactl list sinks | grep Volume | head -n 1 | awk '{print $5}') "墳"
else
	echo "ﱝ"
fi
