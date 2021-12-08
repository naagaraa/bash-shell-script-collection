#!/usr/bin/env bash

##################################################################
# Author : miyuki nagara
# Date: 2021-12-05
# Web Development tools installer
##################################################################

##################################################################
# function usage
# description for display message
##################################################################
usage() {
    cat <<EOF
Name: 
=====
Web Development Toolkit


Description: 
============
This script install all Backpack for Web Development what I used


Web Development modules:
================================================================
vscode, xclip, sublimetext, leafpad, terminator, zsh

Programing Language Modules
================================================================
php, python, go, pip, node, npm, yarn, nvm

Usage:
================================================================
welcome to my tools automation install backpack :

1. install web development toolkit           | install web toolkit
2. install Programing langugue               | install programing toolkit
2. install XAMP                              | Install xampp (optional)
3. uninstall web development toolkit         | install LAMP STACK
4. uninstall programing language             | install LAMP STACK



EOF
    echo -n "chose what you want : 1(install)/2(uninstall) : "
    read menu

    if [[ $menu == "1" ]]
    then
        echo ""
        echo "+------------------------------------------+"
        echo "|                                          |"
        echo "| INSTALL WEB DEVELOPMENT TOOL             |"
        echo "|                                          |"
        echo "+------------------------------------------+"
        install_web_toolkit
    elif [[ $menu == "2" ]]
    then
        echo ""
        echo "+------------------------------------------+"
        echo "|                                          |"
        echo "| INSTALL PROGRAMING TOOL                  |"
        echo "|                                          |"
        echo "+------------------------------------------+"
        install_programing_lang
    elif [[ $menu == "3" ]]
    then
        echo ""
        echo "+------------------------------------------+"
        echo "|                                          |"
        echo "| INSTALL XAMPP                            |"
        echo "|                                          |"
        echo "+------------------------------------------+"
        install_xampp
    elif [[ $menu == "4" ]]
    then
        echo ""
        echo "+------------------------------------------+"
        echo "|                                          |"
        echo "| UNINSTALL WEB DEV TOOL                |"
        echo "|                                          |"
        echo "+------------------------------------------+"
        install_programing_lang
    elif [[ $menu == "4" ]]
    then
        echo ""
        echo "+------------------------------------------+"
        echo "|                                          |"
        echo "| UNINSTALL PROGRAMING TOOL                  |"
        echo "|                                          |"
        echo "+------------------------------------------+"
        install_programing_lang
    else
        echo "you wrong input"
    fi
}


##################################################################
# function install_web toolkit
# description for run web toolkit
##################################################################
install_web_toolkit(){
    echo -n "you wanna install web dev toolkit ? y(yes)/n(no) : "
    read answer
    if [ $answer == "y" ]
    then
        echo "update"
        sudo apt update
        echo "install htop"
        sudo apt install htop
        echo "install neofetch"
        sudo apt install neofetch
        sudo apt install dirmngr gnupg apt-transport-https ca-certificates software-properties-common
        echo " import the repository GPG key and the sublime APT Repository"
        curl -fsSL https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
        sudo add-apt-repository "deb https://download.sublimetext.com/ apt/stable/"
        echo "download vscode"
        wget -O vscode.deb https://az764295.vo.msecnd.net/stable/ccbaa2d27e38e5afa3e5c21c1c7bef4657064247/code_1.62.3-1637137107_amd64.deb

        echo "give permission"
        sudo chmod +x vscode.deb

        echo "install sublime text 3"
        sudo apt install sublime-text

        echo "install vscode"
        sudo dpkg -i vscode.deb

        echo "install leafpad"
        sudo apt install leafpad

        echo "install terminator"
        sudo apt install terminator

        echo "install xclip"
        sudo apt install xclip

        echo "install zsh"
        sudo apt install zsh

        echo "done install web dev toolkit"
    elif [ $answer == "n" ]
    then
        echo "sorry I don't wanna install composer"
    else
        echo "sorry your worng input"
    fi
}

install_php(){
    echo -n "you wanna install php version? Y(yes)/N(No) : "
    read answer

    if [[ $answer == "y" ]]
    then
        echo -n "you wanna install php version? (8)/(7.4)/(7.3)/(7.2)/(5.6) : "
        read versionphp

        #install php
        echo "sudo apt install -y php$versionphp"
        sudo apt install -y php$versionphp
        echo "sudo service apache2 restart"
        sudo service apache2 restart

        # install php modules
        echo "sudo apt-cache search php7*"
        sudo apt-cache search php$versionphp*
        echo "sudo apt install php7.4-mysql php7.4-curl php7.4-json php7.4-cgi php7.4-xsl"
        sudo apt install php$versionphp libapache2-mod-php$versionphp php$versionphp-curl php-pear php$versionphp-gd php$versionphp-dev php$versionphp-zip php$versionphp-mbstring php$versionphp-mysql php$versionphp-xml curl -y
        echo "sudo update-alternatives --config php"
        sudo update-alternatives --config php
    elif [[ $answer == "n" ]]
    then
        echo "sorry I don't wanna install php"
    else
        echo "you wrong input bro"
    fi
}

install_xampp(){
    echo -n "you wanna install xampp php v7.4? y(yes)/n(no) : "
    read answer
    if [ $answer == "y" ]
    then
    echo "download xampp 7.4"

    wget -O xampp.run https://downloadsapachefriends.global.ssl.fastly.net/7.4.26/xampp-linux-x64-7.4.26-0-installer.run?from_af=true

    echo "give permision"
    sudo chmod +x xampp.run

    echo "install them"
    sudo ./xampp.run

    echo "done install xampp"

    elif [ $answer == "n" ]
    then
        echo "sorry I don't wanna install xampp"
    else
        echo "sorry your worng input"
    fi

}

install_yarn()
{
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
    sudo apt update
    sudo apt install --no-install-recommends yarn
    yarn --version
}

install_nvm()
{
    sudo apt update
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
    source ~/.bashrc
    nvm list-remote

}

install_nodejs()
{
    sudo apt update
    sudo apt install nodejs
    node -v
}

install_python()
{
    sudo apt update
    sudo apt install software-properties-common
    sudo add-apt-repository ppa:deadsnakes/ppa
    sudo apt update
    sudo apt install python3.8
    sudo apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget
    sudo apt install python3-pip
    pip3 --version
    python3 --version
}

install_go()
{
    wget -c https://dl.google.com/go/go1.14.2.linux-amd64.tar.gz -O - | sudo tar -xz -C /usr/local
    export PATH=$PATH:/usr/local/go/bin
    source ~/.profile
    go version
}

##################################################################
# function install_programign set
# description for run composer install
##################################################################
install_programing_lang(){
    echo -n "you wanna install programing langauge set? y(yes)/n(no) : "
    read answer
    if [ $answer == "y" ]
    then
        # install programing langauge
        echo "sudo apt install software-properties-common"
        sudo apt install software-properties-common
        echo "sudo add-apt-repository ppa:ondrej/php"
        sudo add-apt-repository ppa:ondrej/php
        echo "sudo apt update"
        sudo apt update
        echo "install php"
        install_php
        echo "install nvm"
        install_nvm
        echo "install nodejs"
        install_nodejs
        echo "install python"
        install_python
        echo "install go"
        install_go
    elif [ $answer == "n" ]
    then
        echo "sorry I don't wanna install programing set"
    else
        echo "sorry your worng input"
    fi
}

usage