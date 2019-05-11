setxkbmap -option 'ctrl:nocaps'
sudo modprobe bbswitch load_state=0 # Disable Nvidia
echo deep | sudo tee /sys/power/mem_sleep
