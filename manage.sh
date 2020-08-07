#!/bin/bash
echo ""
echo "==========================================="
echo "==|| RAk3rman Minecraft Status Manager ||=="
echo "==========================================="
echo ""
#Check to see if servers are running
Waterfall_status="false"
Survival_status="false"
if screen -list | grep -q "Waterfall"; then
    echo "RMSM | ✔ Waterfall is Online"
    Waterfall_status="true"
else
    echo "RMSM | ✘ Waterfall is Offline"
fi
if screen -list | grep -q "Survival"; then
    echo "RMSM | ✔ Survival is Online"
    Survival_status="true"
else
    echo "RMSM | ✘ Survival is Offline"
fi
echo ""
echo "RMSM | What would you like to do?"
echo "   1) Start/restart all servers"
echo "   2) Halt all servers"
echo "   3) 1 min safe restart"
echo "   4) Exit"
echo ""
until [[ "$MENU_OPTION" =~ ^[1-4]$ ]]; do
    read -rp "Select an option [1-4]: " MENU_OPTION
done
case $MENU_OPTION in
		    1)
		    	echo ""
          if [ "$Waterfall_status" == "true" ]; then
            echo "RMSM | Halting Waterfall"
            screen -r "Waterfall" -X stuff $'end\n'
            sleep 5
            screen -r "Waterfall" -X stuff $'exit\n'
            echo "RMSM | Halted Waterfall peacefully"
            sleep 1
          fi
          if [ "$Survival_status" == "true" ]; then
            echo "RMSM | Halting Survival"
            screen -r "Survival" -X stuff $'stop\n'
            sleep 5
            screen -r "Survival" -X stuff $'exit\n'
            echo "RMSM | Halted Survival peacefully"
            sleep 1
          fi
          echo "RMSM | Starting all servers..."
          echo "RMSM | Starting Waterfall"
          cd Waterfall
          screen -S "Waterfall" -d -m
          screen -r "Waterfall" -X stuff $'java -Xms1G -Xmx1G -jar waterfall.jar\n'
          cd
          echo "RMSM | Waterfall Online"
          echo "RMSM | Starting Survival"
          cd 16-Survival
          screen -S "Survival" -d -m
          screen -r "Survival" -X stuff $'java -Xms2G -Xmx2G -jar paper.jar\n'
          cd
          echo "RMSM | Survival Online"
          echo ""
          exit 0
		    ;;
		    2)
			    echo ""
          echo "RMSM | Halting all servers..."
          if [ "$Waterfall_status" == "true" ]; then
            echo "RMSM | Halting Waterfall"
            screen -r "Waterfall" -X stuff $'end\n'
            sleep 5
            screen -r "Waterfall" -X stuff $'exit\n'
            echo "RMSM | Halted Waterfall peacefully"
            sleep 1
          fi
          if [ "$Survival_status" == "true" ]; then
            echo "RMSM | Halting Survival"
            screen -r "Survival" -X stuff $'stop\n'
            sleep 5
            screen -r "Survival" -X stuff $'exit\n'
            echo "RMSM | Halted Survival peacefully"
            sleep 1
          fi
          echo ""
          exit 0
		    ;;
		    3)
			    echo ""
			    echo "RMSM | Server Restarting in 60 seconds"
			    screen -r "Survival" -X stuff $'title @a subtitle {"text":"in 60 seconds", "bold":true}\n'
			    screen -r "Survival" -X stuff $'title @a title {"text":"Server Restarting", "bold":true, "color":"red"}\n'
			    sleep 30
			    echo "RMSM | Server Restarting in 30 seconds"
			    screen -r "Survival" -X stuff $'title @a subtitle {"text":"in 30 seconds", "bold":true}\n'
			    screen -r "Survival" -X stuff $'title @a title {"text":"Server Restarting", "bold":true, "color":"red"}\n'
			    sleep 15
			    echo "RMSM | Server Restarting in 15 seconds"
			    screen -r "Survival" -X stuff $'title @a subtitle {"text":"in 15 seconds", "bold":true}\n'
			    screen -r "Survival" -X stuff $'title @a title {"text":"Server Restarting", "bold":true, "color":"red"}\n'
			    sleep 5
			    echo "RMSM | Server Restarting in 10 seconds"
			    screen -r "Survival" -X stuff $'title @a subtitle {"text":"in 10 seconds", "bold":true}\n'
			    screen -r "Survival" -X stuff $'title @a title {"text":"Server Restarting", "bold":true, "color":"red"}\n'
			    sleep 5
			    echo "RMSM | Server Restarting in 5 seconds"
			    screen -r "Survival" -X stuff $'title @a subtitle {"text":"in 5 seconds", "bold":true}\n'
			    screen -r "Survival" -X stuff $'title @a title {"text":"Server Restarting", "bold":true, "color":"red"}\n'
			    sleep 5
          if [ "$Waterfall_status" == "true" ]; then
            echo "RMSM | Halting Waterfall"
            screen -r "Waterfall" -X stuff $'end\n'
            sleep 5
            screen -r "Waterfall" -X stuff $'exit\n'
            echo "RMSM | Halted Waterfall peacefully"
            sleep 1
          fi
          if [ "$Survival_status" == "true" ]; then
            echo "RMSM | Halting Survival"
            screen -r "Survival" -X stuff $'stop\n'
            sleep 5
            screen -r "Survival" -X stuff $'exit\n'
            echo "RMSM | Halted Survival peacefully"
            sleep 1
          fi
          echo "RMSM | Starting all servers..."
          echo "RMSM | Starting Waterfall"
          cd Waterfall
          screen -S "Waterfall" -d -m
          screen -r "Waterfall" -X stuff $'java -Xms1G -Xmx1G -jar waterfall.jar\n'
          cd
          echo "RMSM | Waterfall Online"
          echo "RMSM | Starting Survival"
          cd 16-Survival
          screen -S "Survival" -d -m
          screen -r "Survival" -X stuff $'java -Xms2G -Xmx2G -jar paper.jar\n'
          cd
          echo "RMSM | Survival Online"
          echo ""
          exit 0
		    ;;
		    4)
			    echo ""
          echo "Exiting manager..."
          echo ""
          exit 0
		    ;;
esac
