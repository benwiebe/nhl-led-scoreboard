#!/bin/bash

# Make script work regardless of where it is run from
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo "Installing systemd service..."

SCRIPTPATH=$DIR/service_entrypoint.sh
sed "s#SCRIPTPATHPLACEHOLDER#$SCRIPTPATH#g" $DIR/nhl-led-scoreboard.service.template > $DIR/nhl-led-scoreboard.service || exit 1

sudo mv $DIR/nhl-led-scoreboard.service /etc/systemd/system/ || exit 1
sudo chmod 777 /etc/systemd/system/nhl-led-scoreboard.service || exit 1
sudo systemctl daemon-reload || exit 1

echo "Enabling service to start on boot"

sudo systemctl enable nhl-led-scoreboard.service || exit 1

echo "Service installation complete!"
echo "You can use \"systemctl start/stop nhl-led-scoreboard.service\" to start and stop the scoreboard."
echo "Run \"systemctl disable nhl-led-scoreboard.service\" to disable start on boot."
