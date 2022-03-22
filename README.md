# Unlocking and relocking scripts for Asus Zenfone Max Pro M1 (X00T/X00TD)

> **I do not bear any responsibility in the catastrophic event that your device gets bricked, you run these scripts at your own risk.**

## DATA WILL BE WIPED SO MAKE A BACKUP

### Unlocking

1. Clone this repository by running `git clone https://github.com/gingkapls/sdm636_unlocker` 
2. cd into `./sdm636_unlocker/`
3. Reboot your phone into fastboot mode by holding down volume up + power on at the same time or alternatively, when the device is powered off.
4. Connect it to your computer and run `./unlock.sh`.
5. Done (probably).

> **Note:** If `./unlock.sh` gets stuck without output for more than 30 seconds, then there is a configuration issue. Try connecting plugging the phone into a different usb port, preferably USB 2.0.

### Relocking
> **Warning:** This has not been tested thoroughly, and may brick your device, exercise caution.

1. Run `./relock.sh` first.
2. Connect the phone to the computer.
3. If everything goes well, it should output "OK" twice. If it does not, repeat the steps again.
4. The warning about unlocked bootloader should not appear on your next reboot.

#### Credits
- [liunianliang](mailto:liunianliang@huaqin.com) for the original scripts.
- [BORETS24](https://telegram.me/BORETS24) for the relocking instructions.

