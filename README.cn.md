# Apollo_env_install

---

gitee：[中文](https://gitee.com/apollo-2d/Apollo_env_install/tree/main) | [English](https://gitee.com/apollo-2d/Apollo_env_install/blob/main/README.md)

github：[中文](https://github.com/Apollo2d/Apollo_env_install/blob/main/README.cn.md) | [English](https://github.com/Apollo2d/Apollo_env_install)

---

旨在为Apollo2d的成员以及其他参与足球仿真2d的小伙伴们一键初始化环境

*来自原作者的缺心小提示：英文文档更新比中文快一点，建议看英文文档呢*

## Background
Robocup2d是个有趣的仿真项目比赛，国内有诸多高校组建队伍参与，其中就有我们来自南京邮电大学的Apollo2d。    
我们曾经也饱受配置2d仿真平台的折磨，但最终我们自己找到的解决之策并积累了丰富的经验。    
大佬ysy决心打破现状，将所有的配置步骤整合成此脚本并开源共所有人使用，希望所有使用此脚本的人都能轻松搭建并从仿真2d中获得快乐!   
期望在Rococup中与你相遇~ ~ ~



## 使用说明

假设你已经获取了脚本名，那么你可以用接下来的指令安装所有必要工具。

```bash
sudo apt update
sudo apt install curl -y
curl https://gitee.com/apollo-2d/Apollo_env_install/raw/main/.apollo_profile > ~/.apollo_profile
curl https://gitee.com/apollo-2d/Apollo_env_install/raw/main/.apollorc > ~/.apollorc
source ~/.apollo_profile
# 下面一步不是必要的，但我推荐你这么做
# 根据你系统的不同，你选择下面的指令之一执行即可
Apollo_change_source_18 #如果你使用的是 Ubuntu 18.04 LTS
Apollo_change_source_20 #如果你使用的是Ubuntu 20.04 LTS
Apollo_install_all
```

## 获取脚本


`Apollo_env_install`是一个用`bash script`写的环境搭建工具，使用的只需要下载 `.apollorc` 和 `. .apollorc`(或者 `source .apollorc`)

**提示**: 从[gitee](https://gitee.com/apollo-2d/Apollo_env_install)下载此脚本         

```bash
curl https://gitee.com/apollo-2d/Apollo_env_install/raw/main/.apollorc > ~/.apollorc
# 或者使用wget
wget https://gitee.com/apollo-2d/Apollo_env_install/raw/main/.apollorc -O ~/.apollrc

. ~/.apollorc
# 或者直接source
source ~/.apollorc
```

## 用法

### 帮助菜单

```bash
Apollo_help
```

### 设置环境变量

Open .apollorc to check more details.

### 查看可用依赖

```bash
Apollo_list
```

输出格式如下

```bash
librcsc rcssserver rcssmonitor soccerwindow2 fedit2
```

### 只安装环境

```bash
Apollo_package
```

这条指令会调用`apt`去安装所有必要的依赖

### 安装所有依赖

```bash
Apollo_install_all
# then wait for 10 seconds and everything will be installed
```

这里有几个变量：

- 设置 `export INTERVAL=0`跳过等待时间
- 输出文件会重定向到 `INS_LOG`变量，默认初始化为`~/Apollo_install.log` 
- 中间文件会被保存`MIDDLE`中，默认初始化为`~/Apollo_install.log` 

安装完所有必要依赖后，清除中间文件

```bash
Apollo_clean
```

### 安装指定依赖

```bash
# take librcsc as example
Apollo_install librcsc
```

### 首先查看可用依赖

```bash
Apollo_list
```

### 比赛开始（两支队伍）

```bash
# Apollo_run [script1] [script2]
Apollo_run ~/apollo2d/start.sh ~/yushan2d/start.sh
# //todo: Feature of recoring teams will be add in next version
```



# License

MIT

# P.S

Welcome students in NJUPT come to Apollo club and enjoy games.
