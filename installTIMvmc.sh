# User input for the archive password
echo Please enter the archive password
read pwd
# Installing tools
sudo apt-get install p7zip-full
# Downloading the scripts
wget -O '/home/pi/Documents/TIMvmcSimFirstInstallation.zip' 'https://github.com/smarterbaxter/TIMvmc/raw/main/TIMvmcSimFirstInstallation.zip'
7z x /home/pi/Documents/TIMvmcSimFirstInstallation.zip -p$pwd -o/home/pi/Documents
rm /home/pi/Documents/TIMvmcSimFirstInstallation.zip
sudo chmod 0755 /home/pi/Documents/restartValina.sh
sudo chmod 0755 /home/pi/Documents/SimulatedVMCupdate.sh
sudo chmod 0755 /home/pi/Documents/st.sh
sudo chmod 0755 /home/pi/Documents/update.sh
# New hostname
sudo apt-get install avahi-daemon
touch /home/pi/Documents/hostname
echo worldlinetim >> /home/pi/Documents/hostname
sudo mv /home/pi/Documents/hostname /etc/hostname
# Android platform tools installation and configuration for Valina
sudo apt-get install -y android-sdk-platform-tools
sudo rm /etc/udev/rules.d/51-android.rules
sudo mv /home/pi/Documents/51-android.rules /etc/udev/rules.d/51-android.rules
sudo udevadm control --reload-rules
# Configuring a new service for the Simulated VMC
sudo mv /home/pi/Documents/vmc.service /etc/systemd/system/vmc.service
sudo systemctl daemon-reload
sudo systemctl enable vmc.service
# Downloading the last version of the Simulated VMC
sh /home/pi/Documents/update.sh