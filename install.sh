#! /bin/bash
set -xe

# 本指令用于首次获取sudo密码
sudo ls

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

}

librcsc(){
	# git clone https://github.com/helios-base/librcsc.git 
	git clone https://gitee.com/apollo-2d/librcsc.git
	cd librcsc
	./bootstrap
	./configure
	make
	sudo make install
	sudo ldconfig
}
rcssserver(){
	# todo : 改成自动更新
	# git clone https://github.com/rcsoccersim/rcssserver.git
	git clone https://gitee.com/apollo-2d/rcssserver.git
	cd rcssserver
	./bootstrap
	./configure
	make
	sudo make install
	sudo ldconfig
	cd ..
}
rcssmonitor(){
	# todo : same above
	# git clone https://github.com/rcsoccersim/rcssmonitor.git
	git clone https://gitee.com/apollo-2d/rcssmonitor.git
	cd rcssmonitor
	./bootstrap
	./configure
	make
	sudo make install
	sudo ldconfig
	cd ..
}

apt
librcsc
rcssserver
rcssmonitor
