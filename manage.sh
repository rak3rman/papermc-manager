#!/bin/bash
echo ""
echo "=============================================="
echo "  papermc-manager | version 1.1               "
echo "  --> Description: A simple minecraft server  "
echo "      management script utilizing screen      "
echo "  --> Authored by: RAk3rman 2020              "
echo "=============================================="
echo ""
# Location of server files | ATTENTION: CHANGE THESE VALUES!
waterfall_directory="/home/rak3rman/Waterfall"
survival_directory="/home/rak3rman/Survival"
if [ ! -d "$waterfall_directory" ]; then
    echo "papermc-manager | ✘ The path '$waterfall_directory' does not exist on your filesystem. Please check the waterfall_directory value in manage.sh"
    exit 0
fi
if [ ! -d "survival_directory" ]; then
    echo "papermc-manager | ✘ The path '$survival_directory' does not exist on your filesystem. Please check the survival_directory value in manage.sh"
    exit 0
fi
# Check the status of the waterfall server, return to console
waterfall_status="false"
if screen -list | grep -q "Waterfall"; then
    echo "papermc-manager | ✔ Waterfall is Online"
    waterfall_status="true"
else
    echo "papermc-manager | ✘ Waterfall is Offline"
fi
# Check the status of the survival server, return to console
survival_status="false"
if screen -list | grep -q "Survival"; then
    echo "papermc-manager | ✔ Survival is Online"
    survival_status="true"
else
    echo "papermc-manager | ✘ Survival is Offline"
fi
echo ""
# Check to see what flags were passed
passed_command=""
while test $# -gt 0; do
  case "$1" in
    -h|--help)
      echo "papermc-manager | Flag options:"
      echo "-h, --help       show help message"
      echo "-r, --restart    immediately start/restart all servers"
      echo "-s, --stop       immediately stop all servers"
      echo "-d, --delayed    wait 1 minute and display countdown title"
      echo "                 in-game, must be used with -r or -s flag"
      echo ""
      exit 0
      ;;
    -r|--restart)
      passed_command="r"
      shift
      ;;
    -s|--stop)
      passed_command="s"
      shift
      ;;
    -d|--delayed)
      # Check to see if Survival is running
      if [ "$Survival_status" == "true" ]; then
        echo "papermc-manager | ✔ Waiting 60 seconds and displaying countdown title"
        echo "papermc-manager | Restarting Survival in 60 seconds"
        screen -r "Survival" -X stuff $'title @a subtitle {"text":"in 60 seconds", "bold":true}\n'
        screen -r "Survival" -X stuff $'title @a title {"text":"Server Restarting", "bold":true, "color":"red"}\n'
        sleep 30
        echo "papermc-manager | Restarting Survival in 30 seconds"
        screen -r "Survival" -X stuff $'title @a subtitle {"text":"in 30 seconds", "bold":true}\n'
        screen -r "Survival" -X stuff $'title @a title {"text":"Server Restarting", "bold":true, "color":"red"}\n'
        sleep 15
        echo "papermc-manager | Restarting Survival in 15 seconds"
        screen -r "Survival" -X stuff $'title @a subtitle {"text":"in 15 seconds", "bold":true}\n'
        screen -r "Survival" -X stuff $'title @a title {"text":"Server Restarting", "bold":true, "color":"red"}\n'
        sleep 5
        echo "papermc-manager | Restarting Survival in 10 seconds"
        screen -r "Survival" -X stuff $'title @a subtitle {"text":"in 10 seconds", "bold":true}\n'
        screen -r "Survival" -X stuff $'title @a title {"text":"Server Restarting", "bold":true, "color":"red"}\n'
        sleep 5
        echo "papermc-manager | Restarting Survival in 5 seconds"
        screen -r "Survival" -X stuff $'title @a subtitle {"text":"in 5 seconds", "bold":true}\n'
        screen -r "Survival" -X stuff $'title @a title {"text":"Server Restarting", "bold":true, "color":"red"}\n'
        sleep 5
      else
        echo "papermc-manager | ✘ Skipping delay because Survival is Offline"
      fi
      shift
      ;;
    *)
      break
      ;;
  esac
done
# If the stop or restart command is passed, make sure the servers are stopped
if [ "$passed_command" == "r" ] || [ "$passed_command" == "s" ]; then
  echo "papermc-manager | Stopping all servers if online..."
  if [ "$waterfall_status" == "true" ]; then
    echo "papermc-manager | Stopping Waterfall"
    screen -r "Waterfall" -X stuff $'end\n'
    sleep 5
    screen -r "Waterfall" -X stuff $'exit\n'
    echo "papermc-manager | ✔ Stopped Waterfall peacefully"
    sleep 1
  else
    echo "papermc-manager | ✘ Waterfall already stopped, skipping"
  fi
  if [ "$survival_status" == "true" ]; then
    echo "papermc-manager | Stopping Survival"
    screen -r "Survival" -X stuff $'stop\n'
    sleep 5
    screen -r "Survival" -X stuff $'exit\n'
    echo "papermc-manager | ✔ Stopped Survival peacefully"
    sleep 1
  else
    echo "papermc-manager | ✘ Survival already stopped, skipping"
  fi
  echo "papermc-manager | ✔ All servers stopped"
fi
# If the restart command is passed, start the servers
if [ "$passed_command" == "r" ]; then
  echo "papermc-manager | Starting all servers..."
  echo "papermc-manager | Starting Waterfall"
  cd $waterfall_directory || exit
  screen -S "Waterfall" -d -m
  screen -r "Waterfall" -X stuff $'java -Xms1G -Xmx1G -jar waterfall.jar\n'
  echo "papermc-manager | ✔ Waterfall Online"
  echo "papermc-manager | Starting Survival"
  cd $survival_directory || exit
  screen -S "Survival" -d -m
  screen -r "Survival" -X stuff $'java -Xms2G -Xmx2G -jar paper.jar\n'
  echo "papermc-manager | ✔ Survival Online"
  echo "papermc-manager | ✔ All servers online"
  echo ""
  echo "papermc-manager | Use 'screen -r Waterfall' or 'screen -r Survival' to attach to the designated screen."
  exit 0
fi
echo "papermc-manager | Flag options:"
echo "-h, --help       show help message"
echo "-r, --restart    immediately start/restart all servers"
echo "-s, --stop       immediately stop all servers"
echo "-d, --delayed    wait 1 minute and display countdown title"
echo "                 in-game, must be used with -r or -s flag"