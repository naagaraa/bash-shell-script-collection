#!/usr/bin/env bash

##################################################################
# Author : miyuki nagara
# Date: 2021-12-05
# LEMP STACK LINUX nginx MYSQL PHP installer
##################################################################

##################################################################
# function usage
# description for display message
##################################################################
usage() {
    cat <<EOF
Name: 
=====
LEMP STACK INSTALLER


Description: 
============
This script install all Backpack for LEMP STACK.


LEMP STACK modules:
===================================================================
PHP, GIT, NGINX, COMPOSER, MYSQL, PHPMYADMIN, and  LARAVEL GLOBAL.

Usage:
===================================================================
welcome to my tools automation install backpack :

1. install LEMP                 | install LEMP STACK
2. uninstall LEMP               | uninstall all LEMP STACK php, git, composer, nginx, mysql, laravel
3. uninstall NGINX              | uninstall NGINX only
4. uninstall git                | uninstall git only
5. uninstall composer           | uninstall composer only
6. uninstall php                | uninstall php only
7. uninstall mysql              | uninstall laravel global
8. uninstall phpmyadmin         | uninstall phpmyadmin


EOF
    echo -n "chose what you want : 1(install)/2(uninstall) : "
    read menu

    if [[ $menu == "1" ]]
    then
        echo ""
        echo "+------------------------------------------+"
        echo "|                                          |"
        echo "| INSTALL LEMP STACK                       |"
        echo "|                                          |"
        echo "+------------------------------------------+"
        install_lemp
    elif [[ $menu == "2" ]]
    then
        echo ""
        echo "+------------------------------------------+"
        echo "|                                          |"
        echo "| UNINSTALL LEMP STACK                     |"
        echo "|                                          |"
        echo "+------------------------------------------+"
        uninstall_lemp
    elif [[ $menu == "3" ]]
    then
        echo ""
        echo "+------------------------------------------+"
        echo "|                                          |"
        echo "| UNINSTALL NGINX                          |"
        echo "|                                          |"
        echo "+------------------------------------------+"
        uninstall_nginx
    elif [[ $menu == "4" ]]
    then
        echo ""
        echo "+------------------------------------------+"
        echo "|                                          |"
        echo "| UNINSTALL GIT  ONLY                      |"
        echo "|                                          |"
        echo "+------------------------------------------+"
        uninstall_git
    elif [[ $menu == "5" ]]
    then
        echo ""
        echo "+------------------------------------------+"
        echo "|                                          |"
        echo "| UNINSTALL COMPOSER  ONLY                 |"
        echo "|                                          |"
        echo "+------------------------------------------+"
        uninstall_composer
    elif [[ $menu == "6" ]]
    then
        echo ""
        echo "+------------------------------------------+"
        echo "|                                          |"
        echo "| UNINSTALL PHP ONLY                       |"
        echo "|                                          |"
        echo "+------------------------------------------+"
        uninstall_php
    elif [[ $menu == "7" ]]
    then
        echo ""
        echo "+------------------------------------------+"
        echo "|                                          |"
        echo "| UNINSTALL MYSQL ONLY                     |"
        echo "|                                          |"
        echo "+------------------------------------------+"
        uninstall_mysql
    elif [[ $menu == "8" ]]
    then
        echo ""
        echo "+------------------------------------------+"
        echo "|                                          |"
        echo "| UNINSTALL PHPMYADMIN ONLY                |"
        echo "|                                          |"
        echo "+------------------------------------------+"
        uninstall_phpmyadmin
    else
        echo "you wrong input"
    fi
}


##################################################################
# function install_lsb
# description for install lsb release and lsb core
##################################################################
install_lsb(){
    echo -n "i need install lsb_release ? y(yes)/n(no) : "
    read answer

    # conditional for install Lsb_release
    if [ $answer == "y" ]
    then
        echo "sudo apt install lsb-release && sudo apt install lsb-core"
        sudo apt install lsb-release && sudo apt install lsb-core
        echo "clear install lsb_release"
    elif [ $answer == "n" ]
    then
        echo "sorry I don't wanna install lsb_release"
    else
        echo "sorry your worng input"
    fi
}

##################################################################
# function install_git
# description for run install git
##################################################################
install_git(){
    echo -n "you wanna install git ? y(yes)/n(no) : "
    read answer
    if [ $answer == "y" ]
    then
        echo "sudo apt install git"
        sudo apt install git 
        echo "Done install git"
    elif [ $answer == "n" ]
    then
        echo "sorry I don't wanna install git"
    else
        echo "sorry your worng input"
    fi
}

##################################################################
# function install_composer
# description for run composer install
##################################################################
install_composer(){
    echo -n "you wanna install composer ? y(yes)/n(no) : "
    read answer
    if [ $answer == "y" ]
    then
        echo "sudo apt install composer"
        curl -sS https://getcomposer.org/installer -o composer-setup.php 
        sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
        composer --version
        echo "Done install composer"
    elif [ $answer == "n" ]
    then
        echo "sorry I don't wanna install composer"
    else
        echo "sorry your worng input"
    fi
}


##################################################################
# function install_nginx
# description for install nginx
##################################################################
install_nginx(){
    echo -n "you wanna install ngnix ? y(yes)/n(no) : "
    read answer
    if [ $answer == "y" ]
    then
        echo "sudo apt install nginx"
        sudo apt install nginx 
        echo "Done install nginx"
        echo "sudo systemctl status nginx"
        sudo systemctl status nginx
        echo "sudo systemctl restart nginx"
        sudo systemctl start nginx
        echo "sudo ufw allow 'Nginx HTTP'"
        sudo ufw allow 'Nginx HTTP'
        sudo ufw status
    elif [ $answer == "n" ]
    then
       echo "sorry I don't wanna install nginx"
    else
        echo "sorry your worng input"
    fi
}

##################################################################
# function install ppa php
# description for run install ppaondrej/php repository
##################################################################
install_php_repo(){
    echo -n "you wanna install php repo ppa:ondrej/php ? y(yes)/n(no) : "
    read answer
    if [ $answer == "y" ]
    then
        echo "sudo apt install software-properties-common"
        sudo apt install software-properties-common
        echo "sudo add-apt-repository ppa:ondrej/php"
        sudo add-apt-repository ppa:ondrej/php
        echo "sudo apt update"
        sudo apt update
        echo "Done install ppa:ondrej/php"
    elif [ $answer == "n" ]
    then
        echo "sorry I don't wanna install ppa:ondrej/php"
    else
        echo "sorry your worng input"
    fi
}

##################################################################
# function install php
# description for run install php version
##################################################################
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
        echo "sudo service nginx restart"
        sudo service nginx restart

        # install php modules
        echo "sudo apt-cache search php7*"
        sudo apt-cache search php$versionphp*
        echo "sudo apt install php7.4-mysql php7.4-curl php7.4-json php7.4-cgi php7.4-xsl"
        sudo apt install php$versionphp php-fpm php$versionphp-curl php-pear php$versionphp-gd php$versionphp-dev php$versionphp-zip php$versionphp-mbstring php$versionphp-mysql php$versionphp-xml curl -y
        echo "sudo update-alternatives --config php"
        sudo update-alternatives --config php
    elif [[ $answer == "n" ]]
    then
        echo "sorry I don't wanna install php"
    else
        echo "you wrong input bro"
    fi
}

##################################################################
# function install mysql
# description for run install mysql
##################################################################
install_mysql(){
    echo -n "you wanna install mysql? Y(yes)/N(No) : "
    read answer

    if [[ $answer == "y" ]]
    then
        echo "install package  mysql"
        sudo apt install mysql-server
        echo "secure install mysql"
        sudo mysql_secure_installation
        echo "run mysql"
        sudo mysql
        echo "open mysql"
        mysql -u root -p
        CREATE USER 'username'@'localhost' IDENTIFIED WITH authentication_plugin BY 'password';
        GRANT PRIVILEGE ON database.table TO 'username'@'localhost';
        GRANT CREATE, ALTER, DROP, INSERT, UPDATE, DELETE, SELECT, REFERENCES, RELOAD on *.* TO 'username'@'localhost' WITH GRANT OPTION;
        FLUSH PRIVILEGES;
        exit
    elif [[ $answer == "n" ]]
    then
        echo "sorry I don't wanna install mysql"
    else
        echo "you wrong input bro"
    fi
}

##################################################################
# function install phpmyadmin
# description for run installphpmyadmin
##################################################################
install_phpmyadmin(){
    echo -n "you wanna install mysql? Y(yes)/N(No) : "
    read answer

    if [[ $answer == "y" ]]
    then
    echo "sudo apt -y install phpmyadmin"
        sudo apt -y install phpmyadmin
    elif [[ $answer == "n" ]]
    then
        echo "sorry I don't wanna install phpmyadmin"
    else
        echo "you wrong input bro"
    fi
}

##################################################################
# function install laravel global
# description for run install laravel which composer global
##################################################################
install_laravel_g(){
    echo "you need istall composer before run this script"
    echo -n "you wanna install laravel global ? Y(yes)/N(No) : "
    read answer

    if [[ $answer == "y" ]]
    then
    # check composer installation
    if ! command -v composer > /dev/null
    then
        echo "<composer> could not be found"
        echo ""
        echo "+------------------------------------------+"
        echo "|                                          |"
        echo "| install composer                         |"
        echo "|                                          |"
        echo "+------------------------------------------+"
        install_composer
    fi

    #runs script install laravel global
    sudo composer global require "laravel/installer"
    export PATH="~/.config/composer/vendor/bin:$PATH"
    elif [[ $answer == "n" ]]
    then
        echo "sorry I don't wanna install laravel global"
    else
        echo "you wrong input bro"
    fi
}

##################################################################
# function unistalL LEMP stack
# description for run unistall all modules LEMP stack
##################################################################
uninstall_lemp(){
    echo ""
    echo "+------------------------------------------+"
    echo "|                                          |"
    echo "|                                          |"
    echo "| it will unistall all                     |" 
    echo "| Unistall nginx                           |"
    echo "| Unistall php                             |"
    echo "| Unistall mysql-server                    |"
    echo "| Unistall phpmyadmin                      |"
    echo "|                                          |"
    echo "+------------------------------------------+"
    echo ""
    echo -n "you wanna uninstall lemp? Y(yes)/N(no) : "
    read answer
    if [ $answer == "y" ]
    then
        sudo apt remove --purge nginx* 
        sudo apt remove --purge php*
        sudo apt remove --purge mysql-server*
        sudo apt remove --purge phpmyadmin
        sudo apt autoremove
        sudo apt autoclean
        echo "Done uninstall lemp"
    elif [ $answer == "n" ]
    then
        echo "sorry I don't wanna uninstall all"
    else
        echo "sorry your worng input"
    fi
}

##################################################################
# function uninstall git
# description for run uninstall git
##################################################################
uninstall_git()
{
    echo ""
    echo "+------------------------------------------+"
    echo "|                                          |"
    echo "| UNINSTALL GIT                            |"
    echo "|                                          |"
    echo "+------------------------------------------+"
    echo ""
    echo -n "you wanna uninstall git? Y(yes)/N(no) : "
    read answer
    if [ $answer == "y" ]
    then
        sudo apt remove --purge git
    elif [ $answer == "n" ]
    then
         echo "sorry I don't wanna uninstall git"
    else
        echo "sorry your worng input"
    fi
}

##################################################################
# function uninstall composer
# description for run uninstall composer
##################################################################
uninstall_composer()
{
    echo ""
    echo "+------------------------------------------+"
    echo "|                                          |"
    echo "| UNINSTALL COMPOSER                       |"
    echo "|                                          |"
    echo "+------------------------------------------+"
    echo ""
    echo -n "you wanna uninstall composer? Y(yes)/N(no) : "
    read answer
    if [ $answer == "y" ]
    then
        sudo apt remove --purge composer
    elif [ $answer == "n" ]
    then
         echo "sorry I don't wanna uninstall composer"
    else
        echo "sorry your worng input"
    fi
}

##################################################################
# function uninstall nginx
# description for run uninstall nginx
##################################################################
uninstall_nginx()
{
    echo ""
    echo "+------------------------------------------+"
    echo "|                                          |"
    echo "| UNINSTALL NGINX                          |"
    echo "|                                          |"
    echo "+------------------------------------------+"
    echo ""
    echo -n "you wanna uninstall NGINX? Y(yes)/N(no) : "
    read answer
    if [ $answer == "y" ]
    then
        sudo apt remove --purge nginx* 
    elif [ $answer == "n" ]
    then
         echo "sorry I don't wanna uninstall nginx"
    else
        echo "sorry your worng input"
    fi
}

##################################################################
# function uninstall mysql
# description for run uninstall mysql
##################################################################
uninstall_mysql()
{
    echo ""
    echo "+------------------------------------------+"
    echo "|                                          |"
    echo "| UNINSTALL MYSQL                          |"
    echo "|                                          |"
    echo "+------------------------------------------+"
    echo ""
    echo -n "you wanna uninstall laravel? Y(yes)/N(no) : "
    read answer
    if [ $answer == "y" ]
    then
        sudo apt remove --purge mysql-server*
    elif [ $answer == "n" ]
    then
        echo "sorry I don't wanna uninstall mysql"
    else
        echo "sorry your worng input"
    fi
}

##################################################################
# function uninstall php
# description for run uninstall php
##################################################################
uninstall_php()
{
    echo ""
    echo "+------------------------------------------+"
    echo "|                                          |"
    echo "| UNINSTALL PHP                            |"
    echo "|                                          |"
    echo "+------------------------------------------+"
    echo ""
    echo -n "you wanna uninstall PHP? Y(yes)/N(no) : "
    read answer
    if [ $answer == "y" ]
    then
        sudo apt remove --purge php*
    elif [ $answer == "n" ]
    then
         echo "sorry I don't wanna uninstall php"
    else
        echo "sorry your worng input"
    fi
}

##################################################################
# function uninstall phpmyadmin
# description for run uninstall phpmyadmin
##################################################################
uninstall_phpmyadmin()
{
    echo ""
    echo "+------------------------------------------+"
    echo "|                                          |"
    echo "| UNINSTALL PHPMYADMIN                     |"
    echo "|                                          |"
    echo "+------------------------------------------+"
    echo ""
    echo -n "you wanna uninstall phpmyadmin? Y(yes)/N(no) : "
    read answer
    if [ $answer == "y" ]
    then
        sudo apt remove --purge phpmyadmin
    elif [ $answer == "n" ]
    then
        echo "sorry I don't wanna uninstall phpmyadmin"
    else
        echo "sorry your worng input"
    fi
}

##################################################################
# function install lemp
# description for run install all modules lemp
##################################################################
install_lemp(){
    # check lsb installation
    if ! command -v lsb_release > /dev/null
    then
        echo "<lsb_release> could not be found"
        echo ""
        echo "+------------------------------------------+"
        echo "|                                          |"
        printf "| %-40s |\n" "`date`"
        echo "|                                          |"
        printf "|`tput bold` %-40s `tput sgr0`|\n" "$@"
        echo "|                                          |"
        echo "| install LSB_RELEASE                      |"
        echo "|                                          |"
        echo "+------------------------------------------+"
        install_lsb
    fi

    # check git installation 
    if ! command -v git > /dev/null
    then
        echo "<git> could not be found"
        echo ""
        echo "+------------------------------------------+"
        echo "|                                          |"
        printf "| %-40s |\n" "`date`"
        echo "|                                          |"
        printf "|`tput bold` %-40s `tput sgr0`|\n" "$@"
        echo "|                                          |"
        echo "| install git                              |"
        echo "|                                          |"
        echo "+------------------------------------------+"
        install_git
    fi

    # check composer installation
    if ! command -v composer > /dev/null
    then
        echo "<composer> could not be found"
        echo ""
        echo "+------------------------------------------+"
        echo "|                                          |"
        printf "| %-40s |\n" "`date`"
        echo "|                                          |"
        printf "|`tput bold` %-40s `tput sgr0`|\n" "$@"
        echo "|                                          |"
        echo "| install composer                         |"
        echo "|                                          |"
        echo "+------------------------------------------+"
        install_composer
    fi

    # check nginx installation
    if ! command -v nginx > /dev/null
    then
        echo "<nginx> could not be found"
        echo ""
        echo "+------------------------------------------+"
        echo "|                                          |"
        printf "| %-40s |\n" "`date`"
        echo "|                                          |"
        printf "|`tput bold` %-40s `tput sgr0`|\n" "$@"
        echo "|                                          |"
        echo "| install NGINX                            |"
        echo "|                                          |"
        echo "+------------------------------------------+"
        install_nginx
    fi

    # check php installation 
    if ! command php -v > /dev/null
    then
        echo "<php> could not be found"
        echo ""
        echo "+------------------------------------------+"
        echo "|                                          |"
        printf "| %-40s |\n" "`date`"
        echo "|                                          |"
        printf "|`tput bold` %-40s `tput sgr0`|\n" "$@"
        echo "|                                          |"
        echo "| install php ppa:ondrej/php               |"
        echo "|                                          |"
        echo "+------------------------------------------+"
        install_php_repo
        echo ""
        echo "+------------------------------------------+"
        echo "|                                          |"
        printf "| %-40s |\n" "`date`"
        echo "|                                          |"
        printf "|`tput bold` %-40s `tput sgr0`|\n" "$@"
        echo "|                                          |"
        echo "| install php version                      |"
        echo "|                                          |"
        echo "+------------------------------------------+"
        install_php
    fi

    # check php installation 
    if ! command -v laravel > /dev/null
    then
        echo "<laravel> could not be found"
        echo ""
        echo "+------------------------------------------+"
        echo "|                                          |"
        printf "| %-40s |\n" "`date`"
        echo "|                                          |"
        printf "|`tput bold` %-40s `tput sgr0`|\n" "$@"
        echo "|                                          |"
        echo "| install laravel global                   |"
        echo "|                                          |"
        echo "+------------------------------------------+"
        install_laravel_g
    fi

    # check mysql installation
    if ! command -v mysql > /dev/null
    then
        echo "<mysql> could not be found"
        echo ""
        echo "+------------------------------------------+"
        echo "|                                          |"
        printf "| %-40s |\n" "`date`"
        echo "|                                          |"
        printf "|`tput bold` %-40s `tput sgr0`|\n" "$@"
        echo "|                                          |"
        echo "| install mysql                            |"
        echo "|                                          |"
        echo "+------------------------------------------+"
        install_mysql
        echo "<mysql> could not be found"
        echo ""
        echo "+------------------------------------------+"
        echo "|                                          |"
        printf "| %-40s |\n" "`date`"
        echo "|                                          |"
        printf "|`tput bold` %-40s `tput sgr0`|\n" "$@"
        echo "|                                          |"
        echo "| install phpmyadmin                       |"
        echo "|                                          |"
        echo "+------------------------------------------+"
        install_phpmyadmin
    fi

    echo ""
    echo "+------------------------------------------+"
    echo "|                                          |"
    printf "| %-40s |\n" "`date`"
    echo "|                                          |"
    printf "|`tput bold` %-40s `tput sgr0`|\n" "$@"
    echo "|                                          |"
    echo "| DONE INSTALL LEMP STACK                  |"
    echo "|                                          |"
    echo "+------------------------------------------+"
    php --version
    mysql --version
    composer --version
    laravel --version
    sudo ufw status
    sudo systemctl status nginx
}

# run script
usage
