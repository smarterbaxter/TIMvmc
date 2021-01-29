# User input for the archive password
echo Please enter the archive password
read pwd
# Installing tools
sudo apt-get install p7zip-full
# Downloading the scripts
wget -O '/home/pi/Documents' 'https://github.com/smarterbaxter/TIMvmc/blob/main/TIMvmcSimFirstInstallation.zip'
7z x /home/pi/Documents/TIMvmcSimFirstInstallation.zip -p$pwd -o/home/pi/Documents
rm /home/pi/Documents/TIMvmcSimFirstInstallation.zip
sudo chmod 0755 /home/pi/Documents/SimulatedVMC/restartValina.sh
sudo chmod 0755 /home/pi/Documents/SimulatedVMC/SimulatedVMCupdate.sh
sudo chmod 0755 /home/pi/Documents/SimulatedVMC/st.sh
sudo chmod 0755 /home/pi/Documents/SimulatedVMC/update.sh
# New hostname
sudo hostname worldlinetim
# Android platform tools installation and configuration for Valina
sudo apt-get install -y android-sdk-platform-tools
sudo nano /etc/udev/rules.d/51-android.rules
SUBSYSTEM=="usb", ATTR{idVendor}=="274c", ATTR{idProduct}=="0101", MODE="0666", GROUP="plugdev"
sudo udevadm control --reload-rules
# Configuring a new service for the Simulated VMC
sudo mv /home/pi/Documents/vmc.service /etc/systemd/system/vmc.service
sudo systemctl daemon-reload
sudo systemctl enable vmc.service
# Downloading the last version of the Simulated VMC
sh /home/pi/Documents/SimulatedVMC/update.sh