# PaperMC Manager
A simple minecraft management script utilizing screen
## Purpose
PaperMC Manager makes it easy to start and stop multiple minecraft servers using screen. This script does not handle updates or configuration of a papermc instance. Rather, it simply starts and stops a set of mincraft servers using screen (with other flags that you can use). I recommend that you read through the script to fully understand what the purpose is. Feel free to fork this repo to match your use case.
## Installation
- Clone the repository from github.com
```
git clone https://github.com/RAK3RMAN/papermc-manager.git
```
- Enter project directory `cd papermc-manager`
- Use `nano manage.sh` to edit the `survival_directory` and `waterfall_directory` values to match your target directory
- Run bash script `bash manage.sh <flags>`
## Usage
When `manage.sh` is run, the script expects one or more of following flags to be passed.
- `-h` or `--help`: show help message
- `-r` or `--restart`: immediately start/restart all servers
- `-s` or `--stop`: immediately stop all servers
- `-d` or `--delayed`: wait 1 minute and display countdown title in-game, must be used with -r or -s flag
### Examples
- `bash manage.sh -r`: Immediately starts/restarts all servers
- `bash manage.sh -s -d`: Waits 1 minute and display countdown title in-game, then stops all servers.