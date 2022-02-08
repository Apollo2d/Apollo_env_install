#!/bin/bash
# set -x
# set -e # 手写了一个catch 函数

# variables
log_name=~/Apollo_install.log
middle_location=~/Apollo_env_install
seconds=5

sudo ls > /dev/null

packages=(librcsc rcssserver rcssmonitor soccerwindow2 fedit2)


Apollo_help(){
    # prompt
    echo -e "\033[34mApollo2d@copyright\033[0m.Contact me with kawhicurry@foxmail.com if there's any problem"
    echo -e "You can now run these command to install package from Apollo"
    echo -e "'Apollo[tab][tab]' to check all available command"
    echo -e "'Apollo_help to ask for help"
    echo -e "'Apollo_install_all' to install all package"
    echo -e "'Apollo_install [package]' to install certain package"
    echo -e "'Apollo_package' to install necessary package"
    echo -e "'Apollo_list to check available package"
}
catch(){
    echo -e "\033[31mSomething went wrong!Check '${log_name}' to see what happened.\033[0m"
    exit 1
}

Apollo_package(){
	# 本段参考了官方文档和合工大的自动安装脚本，感谢合工大的前辈们
	sudo apt update
	sudo apt install -y git vim
	sudo apt install -y libboost-all-dev
	sudo apt install -y g++ automake
	# from rcssserver
	sudo apt install -y g++ make libboost-all-dev bison flex
	# from rcssmonitor
	sudo apt install -y build-essential libboost-all-dev qt5-default libfontconfig1-dev libaudio-dev libxt-dev libglib2.0-dev libxi-dev libxrender-dev 
	# from librcsc
	sudo apt install -y libboost-dev libcppunit-dev
    # from soccerwindow2 which same as rcssmonitor
    # sudo apt install build-essential libboost-all-dev qt5-default libfontconfig1-dev libaudio-dev libxt-dev libglib2.0-dev libxi-dev libxrender-dev 
    # from fedit2 which use qt5 today
    # sudo apt install -y libqt4-dev libxpm-dev libaudio-dev libxt-dev libpng-dev libglib2.0-dev libfreetype6-dev libxrender-dev libxext-dev libfontconfig-dev libxi-dev
}

Apollo_list(){
    echo "${packages[@]}"
}

Apollo_install(){
    if [[ -z `which $1` && -z `ldconfig -p | grep $1` ]]
    then
        echo "will install $1"
        if ![ -d $1 ]
        then
            git clone https://gitee.com/apollo-2d/$1.git
        fi        
        cd $1
        ./bootstrap || catch
        ./configure || catch
        make || catch
        sudo make install || catch
        sudo ldconfig || catch
        cd ..
        echo -e "\033[47;30m$1\033[0m has been installed"
    else
        echo -e "\033[47;30m$1\033[0m is installed already"
    fi
    echo $1
}

Apollo_clean(){
    echo -e "Are you sure middle files are in the right directoriy?\033[35;4m \"$middle_location\"\033[0m" 
    read -p "(Click 'y' or 'Y' to ensure)" ok
    if [ $ok = 'y' -o $ok = 'Y' ]
    then
        echo -e "\033[31mCleaning ${log_name}\033[0m"
        rm ${log_name} -f
        for i in `ls ${middle_location}`
        do
            if [ -d $i ]
            then
                echo -e "\033[31mCleaning $middle_location/$i/\033[0m"
                rm -rf ${middle_location}/$i
            fi
        done
    fi
}

countdown(){
    while [ $seconds -gt 0 ];do
      echo -n "Install will start in $seconds seconds"
      sleep 1
      seconds=$(($seconds - 1))
      echo -ne "\r     \r" #清除本行文字
    done
}

Apollo_install_all(){
    echo -e "By printing \033[35;4m'./install.sh help'\033[0m to ask for help"
    echo -e "Will install ${#packages[*]} software:\033[47;30m${packages[*]}\033[0m"
    echo -e "The script will download and compile in \033[32m${middle_location}\033[0m"
    echo -e "Pressing \033[35;4m[Ctrl]+c\033[0m to stop at anytime"  
    # countdown

    # workding directory
    if [ ! -d ${middle_location} ]
    then
        mkdir ${middle_location}
    fi
    cd ${middle_location}

    # main steps
    package
    for to_install in $packages
    do
        Apollo_install $to_install
    done
    echo "All installed!"
}

Apollo_help