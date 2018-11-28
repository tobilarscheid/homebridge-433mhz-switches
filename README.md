# homebridge-433mhz-switches
(Very opinionated) approach to get 433mhz switches running with homebridge. I had no luck with [homebridge-rcswitch](https://www.npmjs.com/package/homebridge-rcswitch) or [homebridge-rcswitch-gpionem](https://www.npmjs.com/package/homebridge-rcswitch-gpiomem) so I decided to roll my own based on scripts.

## Install script plugin

`npm install -g homebridge-script2`

## Install wiringPI

```
cd ~
git clone git://git.drogon.net/wiringPi
cd wiringPi
./build
```

## Clone & compile 433Utils

```bash
cd ~
git clone --recursive https://github.com/ninjablocks/433Utils
cd 433Utils/RPi_utils
make
```

## Download script to send codes

```bash
git clone https://github.com/tobilarscheid/homebridge-433mhz-switches
```

## homebridge config

Add something like the following to your homebridge config:

```json
{
    "accessory": "Script2",
    "name": "Lichterkette",
    "on": "/home/pi/homebridge-433mhz-switches/send.sh <on code of your switch, e.g. 4194325>",
    "off": "/home/pi/433Utils/homebridge-433mhz-switches/send.sh <off code of your switch, e.g. 4194324>"
}
```
