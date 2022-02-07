#! /bin/bash
#set -x
set -e
log_name=~/Apollo_install.log
middle_location=~/Apollo_env_install

sudo ls > ${log_name}

all=(librcsc rcssserver rcssmonitor soccerwindow2 fedit2)
to_installs=${all[*]}

apt(){
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


install_any(){
    if [ $# -ne 1 ]
    then
        echo "need one argument!"
        return
    fi
    if [[ -z `which $1` && -z `ldconfig -p | grep $1` ]]
    then
        echo "will install $1"
        git clone https://gitee.com/apollo-2d/$1.git
        cd $1
        ./bootstrap
        ./configure
        make
        sudo make install
        sudo ldconfig
        cd ..
    else
        echo "$1 has been installed"
    fi
}

clean(){
    read -p "Are you sure you're in right directoriy(/../Apollo_env_install)? (Click 'y' to ensure)" ok
    if [ $ok = 'y' ]
    then
        for i in `ls`
        do
            if [ -d $i ]
            then
                rm -rf $i
                rm *log
            fi
        done
    fi
}

main(){
    seconds=5
    echo -e "will install all three software:${all[*]}\nWait for ${seconds}seconds.\nPressing [ctrl]+c to stop anytime"
    sleep $seconds
    mkdir ${middle_location} || cd ${middle_location}
    cd ${middle_location}
    apt
    for to_install in $to_installs
    do
        install_any $to_install
    done
    echo "All installed!"
}

#main > ${log_name} 2>&1 &
echo -e "\033[47;30mDon't worry.It's installing in the background.\033[0m"
echo -e "Use \033[35;4m'tail -f ${log_name}'\033[0m to see more details.(and ctrl+c to exit)"
echo -e "Just hang around and have a cup of \033[32mtea\033[0m now."

