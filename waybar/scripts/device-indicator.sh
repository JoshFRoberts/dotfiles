

icon_cpu=""; icon_ram=""; icon_disk=""; icon_time=""
icon_vol=""; icon_net="󰈀"; icon_temp=""; icon_music="󰎆"; icon_pkg="󰏗"


SINK=$(pactl info | grep "Default Sink" )
BENZ="alsa_output.usb-GeneralPlus_USB_Audio_Device-00.analog-stereo"
RODE="alsa_output.usb-RODE_Microphones_RODE_NT-USB-00.analog-stereo"


case "${SINK##*\: }" in
  $BENZ) echo " 1:  "
  ;;
  $RODE) echo " 2:  "
  ;;
  *) echo "0:E"
  ;;
esac

