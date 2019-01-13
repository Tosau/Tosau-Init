#!/usr/bin/env bash
bold=$(tput bold)
normal=$(tput sgr0)

if ! [ $(id -u) = 0 ]; then
   echo "The script need to be run as root." >&2
   exit 1
fi

echo "Welcome to Tosau!"
echo "This is initialization script to prepare your system for Tosau setup"
echo "We need to install git, ruby and few others to enable cloning our repositories and running scripts"
echo "To keep you entertained, we will tell you why is our project called Tosau"
echo "Its an acronym for ${bold}TO${normal}mato ${bold}SAU${normal}ce, the food that I ate before creating this project"
echo
read -r -p "Are you sure you want to change your life? [y/N] " response
response=${response,,}    # tolower
if [[ "$response" =~ ^(yes|y)$ ]]
then
    sudo pacman --noconfirm -S git ruby
    mkdir ./Tosau-Setup
    git clone https://github.com/Tosau/Tosau-Setup/ ./Tosau-Setup
    cd ./Tosau-Setup
    sudo chmod +x ./*.rb
    echo "Starting setup"
    sudo ruby main.rb
