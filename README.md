# Apollo_env_install
Initialize enviorment for members of Apollo2d and others who attend Soccer 2D Simulation.

## Background
Robocup2d is an interesting simulation project that lots of teams in china involve in and Apollo2d from NJUPT is one of them.

We used to suffer from installing enviroment of 2D platform,but we finally figure it out and accumulate a lot of experience.

We decide to organising all of them and make them open source.We hope these will help everyone who enjoy soccer games of 2D simulation.

See u next `robocup`.

## TLDR
You can install all necessary software with commands below:
```bash
sudo apt update
sudo apt install curl -y
curl https://gitee.com/apollo-2d/Apollo_env_install/raw/main/.apollorc > ~/.apollorc
source ~/.apollorc
Apollo_install_all
```

## Install
`Apollo_env_install` is an enviorment set-up tools that write with `bash script`.All you need to do is dowanload `.apollorc` and `. .apollorc`(or `source .apollorc`)

**Notice**:The scripts clone repo from gitee.
```bash
curl https://gitee.com/apollo-2d/Apollo_env_install/raw/main/.apollorc > ~/.apollorc
# or with wget
wget https://gitee.com/apollo-2d/Apollo_env_install/raw/main/.apollorc -O ~/.apollrc

. ~/.apollorc
# or use source directly
source ~/.apollorc
```


## Usage

### Help menu
```bash
Apollo_help
```

### Check available software
```bash
Apollo_list
```
output are like below
```bash
librcsc rcssserver rcssmonitor soccerwindow2 fedit2
```

### Install enviroment only
```bash
Apollo_package
```
This command will call `apt` to install all necessary packages

### Install all software
```bash
Apollo_install_all
# then wait for 10 seconds and everything will be installed
```
There's some variables here.
- You can skip waiting by set `export INTERVAL=0`.
- Output files are redirect to variable `INS_LOG`, which is set at `~/Apollo_install.log` by default
- Middle files are saved at `MIDDLE`, which is set at `~/Apollo_env_install` by default

After install all necessary software, you can clean all middle files.
```bash
Apollo_clean
```

### Install particular sortware
```bash
# take librcsc as example
Apollo_install librcsc
```
Check available package by `Apollo_list` first

### Check available software first
```bash
Apollo_list
```

### Begin a match of two team
```bash
# Apollo_run [script1] [script2]
Apollo_run ~/apollo2d/start.sh ~/yushan2d/start.sh
# //todo: Feature of recoring teams will be add in next version
```



```bash
'Apollo_help' to ask for help
'Apollo_[tab][tab]' to check all available command
'Apollo_install_all' to install all package
'Apollo_install [package]' to install certain package
'Apollo_package' to install necessary package
'Apollo_list' to check available package
'export INTERVAL=0' to skip installation waiting
'export LOGGER=/path/to/your/error.log' to set your log location
'export MIDDLE=/path/to/your/middle_file/' to set your middle files' location
```

# License
MIT

# P.S
Welcome students in NJUPT come to Apollo club and enjoy games.
