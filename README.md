# Apollo_env_install

---

gitee：[中文](https://gitee.com/apollo-2d/Apollo_env_install/tree/main) | [English](https://gitee.com/apollo-2d/Apollo_env_install/blob/main/README.md)

github：[中文](https://github.com/Apollo2d/Apollo_env_install/blob/main/README.cn.md) | [English](https://github.com/Apollo2d/Apollo_env_install)

---

Initialize enviorment for members of Apollo2d and others who attend Soccer 2D Simulation.

## Background

Robocup2d is an interesting simulation project that lots of teams in China participate in and Apollo2d from NJUPT is one of them.

We used to suffer from installing enviroment of 2D platform,but we finally figure it out and accumulate a lot of experience.

We decide to collect all of them and make them open to everyone.We hope these will help everyone who enjoy soccer games of 2D simulation.

Submit issue in [github](https://github.com/Apollo2d/Apollo_env_install) or contact me by email <kawhicurry@foxmail.com> if you discover any bug.

See u next `robocup`.

## TLDR

You can install all necessary software with commands below:

```bash
sudo apt update
sudo apt install curl -y
curl https://gitee.com/apollo-2d/Apollo_env_install/raw/main/.apollo_profile > ~/.apollo_profile
curl https://gitee.com/apollo-2d/Apollo_env_install/raw/main/.apollorc > ~/.apollorc
source ~/.apollo_profile
# Next step is not necessary but recommand
# If you want to change source of apt ,just choose one of them
Apollo_change_source_18 #If you use Ubuntu 18.04
Apollo_change_source_20 #If you use Ubuntu 20.04
Apollo_install_all
```

## Install

`Apollo_env_install` is an enviorment set-up tools that write with `bash script`.All you need to do is dowanload `.apollo_profile` and `.apollorc`,Then `source .apollo_profile`(or `. .apollo_profile`).

You can add `source ~/.apollo_profile` to your `~/.bashrc` or `~/.profile`,too.(If you know what you're doing)

**Notice**:The scripts clone repo from gitee.

```bash
#download env shell first
curl https://gitee.com/apollo-2d/Apollo_env_install/raw/main/.apollo_profile > ~/.apollo_profile
curl https://gitee.com/apollo-2d/Apollo_env_install/raw/main/.apollorc > ~/.apollorc
# or with wget
wget https://gitee.com/apollo-2d/Apollo_env_install/raw/main/.apollo_profile -O ~/.apoll_profile
wget https://gitee.com/apollo-2d/Apollo_env_install/raw/main/.apollorc -O ~/.apollrc

# source it
. ~/.apollo_profile
# or use source directly
source ~/.apollo_profile
```

## Usage

### Help menu

```bash
Apollo_help
```

### Set up enviroment variables

Open .apollorc to check more details.

### Check available software

```bash
Apollo_list
```

output are like below

```bash
librcsc rcssserver rcssmonitor soccerwindow2 fedit2
```

### Change apt source

```bash
Apollo_change_source
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

### Install particular software

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

# License

MIT

# P.S

Welcome students in NJUPT come to Apollo club and enjoy games.