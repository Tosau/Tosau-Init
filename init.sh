if ! [ $(id -u) = 0 ]; then
   echo "The script need to be run as root." >&2
   exit 1
fi

if [ $SUDO_USER ]; then
    real_user=$SUDO_USER
else
    real_user=$(whoami)
fi

HOME="/home/$real_user"

echo "Welcome to Tosau!"
echo "This is initialization script to prepare your system for Tosau setup"
echo "We need to install git, ruby and few others to enable cloning and running scripts"
echo "to keep you entertained, we will tell you why is our project called Tosau"
echo "Its an acronym for TOmato SAUce, the food that I ate before creating this project"
echo
read -r -p "Are you sure you want to change your life? [y/N] " response
response=${response,,}    # tolower
if [[ "$response" =~ ^(yes|y)$ ]]
then
    sudo pacman --noconfirm -S git ruby
    mkdir $HOME/Tosau-Setup
    git clone https://github.com/Tosau/Tosau-Setup/ $HOME/Tosau-Setup
    cd $HOME/Tosau-Setup
    sudo chmod +x $HOME/Tosau-Setup/*.rb
    echo "Starting setup"
    sudo ruby main.rb
