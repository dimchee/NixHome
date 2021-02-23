swaymsg -t get_inputs | jq '.[] | select(.identifier == "1:1:AT_Translated_Set_2_keyboard") | .xkb_active_layout_name' | tr -d '"'
