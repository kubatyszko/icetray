docker run -v /Users/kt/nextpnr/ice40/examples/blinky/:/blink -it veri:latest bash

## this assumes you have nextpnr examples folder on YOUR machine, to ensure that the outputs produced are persisted,
## you could run this navigating to /tmp/nextpnr/ice40/examples/blinky but the outputs will be erased once you exit the container

