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
waterfall1_directory="/home/rak3rman/Trackers-Waterfall"
survival1_directory="/home/rak3rman/Trackers-S1"
waterfall2_directory="/home/rak3rman/Mine9-Waterfall"
survival2_directory="/home/rak3rman/Mine9-S3"
if [ ! -d "$waterfall1_directory" ]; then
    echo "papermc-manager | ✘ The path '$waterfall1_directory' does not exist on your filesystem. Please check the waterfall1_directory value in manage.sh"
    echo ""
    exit 0
fi
if [ ! -d "$survival1_directory" ]; then
    echo "papermc-manager | ✘ The path '$survival1_directory' does not exist on your filesystem. Please check the survival1_directory value in manage.sh"
    echo ""
    exit 0
fi
if [ ! -d "$waterfall2_directory" ]; then
    echo "papermc-manager | ✘ The path '$waterfall2_directory' does not exist on your filesystem. Please check the waterfall2_directory value in manage.sh"
    echo ""
    exit 0
fi
if [ ! -d "$survival2_directory" ]; then
    echo "papermc-manager | ✘ The path '$survival2_directory' does not exist on your filesystem. Please check the survival2_directory value in manage.sh"
    echo ""
    exit 0
fi
# Check the status of the waterfall server, return to console
waterfall1_status="false"
if screen -list | grep -q "Trackers_Waterfall"; then
    echo "papermc-manager | ✔ Trackers Waterfall is Online"
    waterfall1_status="true"
else
    echo "papermc-manager | ✘ Trackers Waterfall is Offline"
fi
# Check the status of the survival server, return to console
survival1_status="false"
if screen -list | grep -q "Trackers_Survival"; then
    echo "papermc-manager | ✔ Trackers Survival is Online"
    survival1_status="true"
else
    echo "papermc-manager | ✘ Trackers Survival is Offline"
fi
# Check the status of the waterfall server, return to console
waterfall2_status="false"
if screen -list | grep -q "Mine9_Waterfall"; then
    echo "papermc-manager | ✔ Mine9 Waterfall is Online"
    waterfall2_status="true"
else
    echo "papermc-manager | ✘ Mine9 Waterfall is Offline"
fi
# Check the status of the survival server, return to console
survival2_status="false"
if screen -list | grep -q "Mine9_Survival"; then
    echo "papermc-manager | ✔ Mine9 Survival is Online"
    survival2_status="true"
else
    echo "papermc-manager | ✘ Mine9 Survival is Offline"
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
      # Check to see if Trackers Survival is running
      if [ "$survival1_status" == "true" ]; then
        echo "papermc-manager | ✔ Waiting 60 seconds and displaying countdown title"
        echo "papermc-manager | Stopping Trackers Survival in 60 seconds"
        screen -r "Trackers_Survival" -X stuff $'title @a subtitle {"text":"in 60 seconds", "bold":true}\n'
        screen -r "Trackers_Survival" -X stuff $'title @a title {"text":"Server Restarting", "bold":true, "color":"red"}\n'
        sleep 30
        echo "papermc-manager | Stopping Trackers Survival in 30 seconds"
        screen -r "Trackers_Survival" -X stuff $'title @a subtitle {"text":"in 30 seconds", "bold":true}\n'
        screen -r "Trackers_Survival" -X stuff $'title @a title {"text":"Server Restarting", "bold":true, "color":"red"}\n'
        sleep 15
        echo "papermc-manager | Stopping Trackers Survival in 15 seconds"
        screen -r "Trackers_Survival" -X stuff $'title @a subtitle {"text":"in 15 seconds", "bold":true}\n'
        screen -r "Trackers_Survival" -X stuff $'title @a title {"text":"Server Restarting", "bold":true, "color":"red"}\n'
        sleep 5
        echo "papermc-manager | Stopping Trackers Survival in 10 seconds"
        screen -r "Trackers_Survival" -X stuff $'title @a subtitle {"text":"in 10 seconds", "bold":true}\n'
        screen -r "Trackers_Survival" -X stuff $'title @a title {"text":"Server Restarting", "bold":true, "color":"red"}\n'
        sleep 5
        echo "papermc-manager | Stopping Trackers Survival in 5 seconds"
        screen -r "Trackers_Survival" -X stuff $'title @a subtitle {"text":"in 5 seconds", "bold":true}\n'
        screen -r "Trackers_Survival" -X stuff $'title @a title {"text":"Server Restarting", "bold":true, "color":"red"}\n'
        sleep 5
      else
        echo "papermc-manager | ✘ Skipping delay because Trackers Survival is offline"
      fi
      # Check to see if Trackers Survival is running
      if [ "$survival2_status" == "true" ]; then
        echo "papermc-manager | ✔ Waiting 60 seconds and displaying countdown title"
        echo "papermc-manager | Stopping Mine9 Survival in 60 seconds"
        screen -r "Mine9_Survival" -X stuff $'title @a subtitle {"text":"in 60 seconds", "bold":true}\n'
        screen -r "Mine9_Survival" -X stuff $'title @a title {"text":"Server Restarting", "bold":true, "color":"red"}\n'
        sleep 30
        echo "papermc-manager | Stopping Mine9 Survival in 30 seconds"
        screen -r "Mine9_Survival" -X stuff $'title @a subtitle {"text":"in 30 seconds", "bold":true}\n'
        screen -r "Mine9_Survival" -X stuff $'title @a title {"text":"Server Restarting", "bold":true, "color":"red"}\n'
        sleep 15
        echo "papermc-manager | Stopping Mine9 Survival in 15 seconds"
        screen -r "Mine9_Survival" -X stuff $'title @a subtitle {"text":"in 15 seconds", "bold":true}\n'
        screen -r "Mine9_Survival" -X stuff $'title @a title {"text":"Server Restarting", "bold":true, "color":"red"}\n'
        sleep 5
        echo "papermc-manager | Stopping Mine9 Survival in 10 seconds"
        screen -r "Mine9_Survival" -X stuff $'title @a subtitle {"text":"in 10 seconds", "bold":true}\n'
        screen -r "Mine9_Survival" -X stuff $'title @a title {"text":"Server Restarting", "bold":true, "color":"red"}\n'
        sleep 5
        echo "papermc-manager | Stopping Mine9 Survival in 5 seconds"
        screen -r "Mine9_Survival" -X stuff $'title @a subtitle {"text":"in 5 seconds", "bold":true}\n'
        screen -r "Mine9_Survival" -X stuff $'title @a title {"text":"Server Restarting", "bold":true, "color":"red"}\n'
        sleep 5
      else
        echo "papermc-manager | ✘ Skipping delay because Trackers Survival is offline"
      fi
      echo ""
      shift
      ;;
    *)
      break
      ;;
  esac
done
# If the stop command is passed, make sure the servers are stopped
if [ "$passed_command" == "s" ]; then
  echo "papermc-manager | Stopping all servers if online..."
  if [ "$waterfall1_status" == "true" ]; then
    echo "papermc-manager | Stopping Trackers Waterfall"
    screen -r "Trackers_Waterfall" -X stuff $'end\n'
    sleep 5
    screen -r "Trackers_Waterfall" -X stuff $'exit\n'
    echo "papermc-manager | ✔ Stopped Trackers Waterfall peacefully"
    sleep 1
  else
    echo "papermc-manager | ✘ Trackers Waterfall already stopped, skipping"
  fi
  if [ "$survival1_status" == "true" ]; then
    echo "papermc-manager | Stopping Trackers Survival"
    screen -r "Trackers_Survival" -X stuff $'stop\n'
    sleep 5
    screen -r "Trackers_Survival" -X stuff $'exit\n'
    echo "papermc-manager | ✔ Stopped Trackers Survival peacefully"
    sleep 1
  else
    echo "papermc-manager | ✘ Trackers Survival already stopped, skipping"
  fi
  if [ "$waterfall2_status" == "true" ]; then
    echo "papermc-manager | Stopping Mine9 Waterfall"
    screen -r "Mine9_Waterfall" -X stuff $'end\n'
    sleep 5
    screen -r "Mine9_Waterfall" -X stuff $'exit\n'
    echo "papermc-manager | ✔ Stopped Mine9 Waterfall peacefully"
    sleep 1
  else
    echo "papermc-manager | ✘ Mine9 Waterfall already stopped, skipping"
  fi
  if [ "$survival2_status" == "true" ]; then
    echo "papermc-manager | Stopping Mine9 Survival"
    screen -r "Mine9_Survival" -X stuff $'stop\n'
    sleep 5
    screen -r "Mine9_Survival" -X stuff $'exit\n'
    echo "papermc-manager | ✔ Stopped Mine9 Survival peacefully"
    sleep 1
  else
    echo "papermc-manager | ✘ Mine9 Survival already stopped, skipping"
  fi
  echo "papermc-manager | ✔ All servers stopped"
  echo ""
  exit 0
fi
# If the restart command is passed, start the servers
if [ "$passed_command" == "r" ]; then
  echo "papermc-manager | Stopping all servers if online..."
  if [ "$waterfall1_status" == "true" ]; then
    echo "papermc-manager | Stopping Trackers Waterfall"
    screen -r "Trackers_Waterfall" -X stuff $'end\n'
    sleep 5
    screen -r "Trackers_Waterfall" -X stuff $'exit\n'
    echo "papermc-manager | ✔ Stopped Trackers Waterfall peacefully"
    sleep 1
  else
    echo "papermc-manager | ✘ Trackers Waterfall already stopped, skipping"
  fi
  if [ "$survival1_status" == "true" ]; then
    echo "papermc-manager | Stopping Trackers Survival"
    screen -r "Trackers_Survival" -X stuff $'stop\n'
    sleep 5
    screen -r "Trackers_Survival" -X stuff $'exit\n'
    echo "papermc-manager | ✔ Stopped Trackers Survival peacefully"
    sleep 1
  else
    echo "papermc-manager | ✘ Trackers Survival already stopped, skipping"
  fi
  if [ "$waterfall2_status" == "true" ]; then
    echo "papermc-manager | Stopping Mine9 Waterfall"
    screen -r "Mine9_Waterfall" -X stuff $'end\n'
    sleep 5
    screen -r "Mine9_Waterfall" -X stuff $'exit\n'
    echo "papermc-manager | ✔ Stopped Mine9 Waterfall peacefully"
    sleep 1
  else
    echo "papermc-manager | ✘ Mine9 Waterfall already stopped, skipping"
  fi
  if [ "$survival2_status" == "true" ]; then
    echo "papermc-manager | Stopping Mine9 Survival"
    screen -r "Mine9_Survival" -X stuff $'stop\n'
    sleep 5
    screen -r "Mine9_Survival" -X stuff $'exit\n'
    echo "papermc-manager | ✔ Stopped Mine9 Survival peacefully"
    sleep 1
  else
    echo "papermc-manager | ✘ Mine9 Survival already stopped, skipping"
  fi
  echo "papermc-manager | ✔ All servers stopped"
  echo ""
  echo "papermc-manager | Starting all servers..."
  echo "papermc-manager | Starting Trackers Waterfall"
  cd $waterfall1_directory || exit
  screen -S "Trackers_Waterfall" -d -m
  screen -r "Trackers_Waterfall" -X stuff $'java -Xms1G -Xmx1G -jar waterfall.jar\n'
  echo "papermc-manager | ✔ Trackers Waterfall Online"
  echo "papermc-manager | Starting Trackers Survival"
  cd $survival1_directory || exit
  screen -S "Trackers_Survival" -d -m
  screen -r "Trackers_Survival" -X stuff $'java -Xms2G -Xmx2G -jar paper.jar\n'
  echo "papermc-manager | ✔ Trackers Survival Online"
  echo "papermc-manager | Starting Mine9 Waterfall"
  cd $waterfall2_directory || exit
  screen -S "Mine9_Waterfall" -d -m
  screen -r "Mine9_Waterfall" -X stuff $'java -Xms1G -Xmx1G -jar waterfall.jar\n'
  echo "papermc-manager | ✔ Mine9 Waterfall Online"
  echo "papermc-manager | Starting Mine9 Survival"
  cd $survival2_directory || exit
  screen -S "Mine9_Survival" -d -m
  screen -r "Mine9_Survival" -X stuff $'java -Xms2G -Xmx2G -jar paper.jar\n'
  echo "papermc-manager | ✔ Mine9 Survival Online"
  echo "papermc-manager | ✔ All servers online"
  echo ""
  echo "papermc-manager | Use 'screen -r <name>' to attach to the designated screen."
  exit 0
fi
echo "papermc-manager | Flag options:"
echo "-h, --help       show help message"
echo "-r, --restart    immediately start/restart all servers"
echo "-s, --stop       immediately stop all servers"
echo "-d, --delayed    wait 1 minute and display countdown title"
echo "                 in-game, must be used with -r or -s flag"
echo ""