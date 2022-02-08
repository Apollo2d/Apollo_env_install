# Apollo_env_install
Initialize enviorment for members of Apollo2d and others who attend Soccer 2D Simulation.

You can run this script with one command:
```bash
sudo apt update
sudo apt install curl -y
bash
curl https://gitee.com/apollo-2d/Apollo_env_install/raw/main/.apollo_envrc > ~/.apollo_envrc
source ~/.apollo_envrc
```
Then run this command to install all necessary package
```bash
Apollo_install_all
```
or check for help
```bash
Apollo_help
```

## middle files
Default middle files will be located at `~/Apollo_env_install/`,you can change it by
```bash
export MIDDLE='/path/to/your/location/'
```