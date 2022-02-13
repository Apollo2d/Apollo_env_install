# Apollo_env_install

---

gitee：[中文](https://gitee.com/apollo-2d/Apollo_env_install/tree/main) | [English](https://gitee.com/apollo-2d/Apollo_env_install/blob/main/README.md)

github：[中文](https://github.com/Apollo2d/Apollo_env_install/blob/main/README.cn.md) | [English](https://github.com/Apollo2d/Apollo_env_install)

---

旨在为Apollo2d的成员以及其他参与足球仿真2d的小伙伴们一键初始化环境

*来自原作者的缺心小提示：英文文档更新比中文快一点，建议看英文文档呢*

## Background
Robocup2d是个有趣的仿真项目比赛，国内有诸多高校组建队伍参与，其中就有我们来自南京邮电大学的Apollo2d。    
我们曾经也饱受配置2d仿真平台的折磨，但最终我们自己找到的解决之策并积累了积累了丰富的经验。    
大佬ysy决心打破现状，将所有的配置步骤整合成此脚本并开源共所有人使用，希望所有使用此脚本的人都能轻松搭建并从仿真2d中获得快乐!   
期望在Rococup中与你相遇~ ~ ~



## TLDR

你可以用接下来的指令安装所有必要工具。

```bash
sudo apt update
sudo apt install curl -y
curl https://gitee.com/apollo-2d/Apollo_env_install/raw/main/.apollorc > ~/.apollorc
source ~/.apollorc
Apollo_install_all
```

## Install


`Apollo_env_install`是一个用`bash script`写的环境搭建工具，使用的只需要下载 `.apollorc` 和 `. .apollorc`(或者 `source .apollorc`)

**提示**: 从gitee（码云）下载此脚本         

```bash
curl https://gitee.com/apollo-2d/Apollo_env_install/raw/main/.apollorc > ~/.apollorc
# 或者使用wget
wget https://gitee.com/apollo-2d/Apollo_env_install/raw/main/.apollorc -O ~/.apollrc

. ~/.apollorc
# 或者直接source
source ~/.apollorc
```


## 用法

```bash
'Apollo_help'  查看帮助
'Apollo_[tab][tab]' 查看所有的可用命令
'Apollo_install_all' 安装所有功能包
'Apollo_install [package]' 安装指定功能包
'Apollo_package' 仅安装必要功能包
'Apollo_list' 查看可获得的功能包
'export INTERVAL=0' 跳过安装等待
'export LOGGER=/path/to/your/error.log' 设置log日志的位置
'export MIDDLE=/path/to/your/middle_file/' 设置中间文件位置
```

# License

MIT

# P.S

Welcome students in NJUPT come to Apollo club and enjoy games.
