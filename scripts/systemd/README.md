# NHL Scoreboard systemd Service

This directory contains the resources to install the scoreboard as a systemd service.
Once installed, the scoreboard can be run in the background and, if
desired, on system boot by using standard `systemctl` commands.

## Service Installation
1. Edit `service_entrypoint.sh` and update the line that starts with `python3` to
   use your preferred launch options. See the Github wiki for more info about
   the available options.
2. Run `install_service.sh`.
3. The service will not start immediately, run `sudo systemctl start nhl-led-scoreboard.service`
   to start the service after installation. Regardless, it will start on the next system boot.

## Controlling the Service
Once installed, you can use the following commands to control the scoreboard service:

- Enable the scoreboard to start on system boot: `sudo systemctl enable nhl-led.scoreboard.service`
- Disable starting on system boot: `sudo systemctl disable nhl-led.scoreboard.service`
- Manually start the service: `sudo systemctl start nhl-led.scoreboard.service`
- Manually stop the service: `sudo systemctl stop nhl-led.scoreboard.service`