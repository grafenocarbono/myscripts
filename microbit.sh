echo "Inside a file we are going to dump the following content:"
echo "2)We want a file that will define a rule in udev"
sudo touch /etc/udev/rules.d/50-microbit.rules
echo "3)We insert the USB subsytem and the id of Vendor"
sudo bash -c "echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="0d28", MODE="0664", GROUP="plugdev"' > /etc/udev/r
ules.d/50-microbit.rules"
echo "4) We add your user to the plugdev group" 
sudo usermod -a -G plugdev $USER
echo "5)Restart the udev rules" 
sudo udevadm control --reload-rules
