#! /bin/bash
set -xe

librcsc(){
	# git clone https://github.com/helios-base/librcsc.git 
	git clone https://github.com/helios-base/librcsc.git
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

librcsc
rcssserver
rcssmonitor
