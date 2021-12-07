#!/usr/bin/env bash

##################################################################
# Author : miyuki nagara
# Date: 2021-12-05
# LAMP STACK LINUX APACHE MYSQL PHP installer
##################################################################

##################################################################
# function usage
# description for display message
##################################################################
usage() {
    cat <<EOF
Name: 
=====
LAMP STACK INSTALLER


Description: 
============
This script install all Backpack for LAMP STACK.


LAMP STACK modules:
===================================================================
PHP, GIT, COMPOSER, MYSQL, PHPMYADMIN, and  LARAVEL GLOBAL.

Usage:
===================================================================
welcome to my tools automation install backpack :

1. install LAMP                 | install LAMP STACK
2. uninstall LAMP               | uninstall all LAMP STACK php, git, composer, apache, mysql, laravel
3. uninstall Apache2            | uninstall apache2 only
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
        echo "| INSTALL LAMP STACK                       |"
        echo "|                                          |"
        echo "+------------------------------------------+"
        install_lamp
    elif [[ $menu == "2" ]]
    then
        echo ""
        echo "+------------------------------------------+"
        echo "|                                          |"
        echo "| UNINSTALL LAMP STACK                     |"
        echo "|                                          |"
        echo "+------------------------------------------+"
        uninstall_lamp
    elif [[ $menu == "3" ]]
    then
        echo ""
        echo "+------------------------------------------+"
        echo "|                                          |"
        echo "| UNINSTALL APACHE2                        |"
        echo "|                                          |"
        echo "+------------------------------------------+"
        uninstall_apache2
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
        sudo systemctl restart apache2
    elif [ $answer == "n" ]
    then
        echo "sorry I don't wanna install laravel lsb_release"
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
        sudo apt install composer 
        echo "Done install composer"
    elif [ $answer == "n" ]
    then
        echo "sorry I don't wanna install composer"
    else
        echo "sorry your worng input"
    fi
}


##################################################################
# function install_apache
# description for install apache2
##################################################################
install_apache(){
    echo -n "you wanna install apache2 ? y(yes)/n(no) : "
    read answer
    if [ $answer == "y" ]
    then
        echo "sudo apt install apache2"
        sudo apt install apache2 
        echo "Done install apache2"
        echo "sudo systemctl status apache2"
        sudo systemctl status apache2
        echo "sudo systemctl restart apache2"
        sudo systemctl start apache2
        echo "sudo ufw allow in 'Apache'"
        sudo ufw allow in "Apache"
        sudo ufw status
    elif [ $answer == "n" ]
    then
       echo "sorry I don't wanna install apache2"
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
    composer global require "laravel/installer"
    export PATH="~/.config/composer/vendor/bin:$PATH"
    elif [[ $answer == "n" ]]
    then
        echo "sorry I don't wanna install laravel global"
    else
        echo "you wrong input bro"
    fi
}

##################################################################
# function unistall lamp stack
# description for run unistall all modules lamp stack
##################################################################
uninstall_lamp(){
    echo ""
    echo "+------------------------------------------+"
    echo "|                                          |"
    echo "|                                          |"
    echo "| it will unistall all                     |" 
    echo "| Unistall apache2                         |"
    echo "| Unistall php                             |"
    echo "| Unistall mysql-server                    |"
    echo "| Unistall phpmyadmin                      |"
    echo "|                                          |"
    echo "+------------------------------------------+"
    echo ""
    echo -n "you wanna uninstall lamp? Y(yes)/N(no) : "
    read answer
    if [ $answer == "y" ]
    then
        sudo apt remove --purge apache2* 
        sudo apt remove --purge php*
        sudo apt remove --purge mysql-server*
        sudo apt remove --purge phpmyadmin
        sudo apt autoremove
        sudo apt autoclean
        echo "Done uninstall lamp"
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
# function uninstall apache2
# description for run uninstall apache2
##################################################################
uninstall_apache2()
{
    echo ""
    echo "+------------------------------------------+"
    echo "|                                          |"
    echo "| UNINSTALL Apache2                        |"
    echo "|                                          |"
    echo "+------------------------------------------+"
    echo ""
    echo -n "you wanna uninstall apache2? Y(yes)/N(no) : "
    read answer
    if [ $answer == "y" ]
    then
        sudo apt remove --purge apache2* 
    elif [ $answer == "n" ]
    then
         echo "sorry I don't wanna uninstall apache"
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
    echo -n "you wanna uninstall laravel? Y(yes)/N(no) : "
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
# function install lamp
# description for run install all modules lamp
##################################################################
install_lamp(){
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

    # check apache installation
    if ! command -v apache2 > /dev/null
    then
        echo "<apache2> could not be found"
        echo ""
        echo "+------------------------------------------+"
        echo "|                                          |"
        printf "| %-40s |\n" "`date`"
        echo "|                                          |"
        printf "|`tput bold` %-40s `tput sgr0`|\n" "$@"
        echo "|                                          |"
        echo "| install apache2                          |"
        echo "|                                          |"
        echo "+------------------------------------------+"
        install_apache
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
    fi

    echo ""
    echo "+------------------------------------------+"
    echo "|                                          |"
    printf "| %-40s |\n" "`date`"
    echo "|                                          |"
    printf "|`tput bold` %-40s `tput sgr0`|\n" "$@"
    echo "|                                          |"
    echo "| DONE INSTALL LAMP STACK                  |"
    echo "|                                          |"
    echo "+------------------------------------------+"
}

# run script
usage
