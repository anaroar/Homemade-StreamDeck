# Homemade Stream Deck
![streamdeck collage](https://github.com/anaroar/Stream-Deck/assets/129563507/d2414920-8a7c-4224-92f9-72d8dd7759a2)
## Overview
This is a homemade stream deck that costs less than $50 to make. Using an external numeric keypad and some scripts, you can create your own macro keypad that can be used to automate a process or execute different commands on your computer. This one in particular is scripted to be able to do the following:
- Run OBS
- Change scenes in OBS (including muting/unmuting the mic as needed)
- Create/save a video clip of the last 15 seconds
- Open other programs
  - Discord
  - Steam
  - Spotify
- Open webpages
- Generate a random question-of-the-day
- Skip songs in the user's media player

## Software Needed
To define and assign your macros, you will need to install an automation scripting language called [AutoHotkey](https://www.autohotkey.com/download/).

You will also need to install [Lua Macros](http://www.hidmacros.eu/download.php) to be able to execute your AutoHotkey (AHK) scripts from an external USB device. The Lua Macros page is also where you can download HID Macros, under the [HIDMacros Download archive](http://www.hidmacros.eu/download.php) section. You will need both, as HID Macros is used to identify the event id of your keypad buttons.  

(Optional) I recommend using [Notepad++](https://notepad-plus-plus.org/downloads/) to write/edit your AHK scripts, but any text editor should suffice.

## Hardware Needed
- An external numeric keypad, like this [Rottay USB Wired Number Pad](https://www.amazon.com/gp/product/B07FFLNF5C/ref=ppx_yo_dt_b_asin_title_o01_s00?ie=UTF8&psc=1)

# Other Materials
- 1/2" square [colored labels](https://www.amazon.com/gp/product/B08M9F8TSB/ref=ppx_yo_dt_b_asin_title_o02_s00?ie=UTF8&psc=1) to put over the keys
  - Alternatively, you can design and print your own labels using Elgato's [stream deck key creator](https://www.elgato.com/us/en/s/keycreator)
- (Optional) A [keycap puller](https://www.amazon.com/gp/product/B01HPC88HM/ref=ppx_yo_dt_b_asin_title_o02_s00?ie=UTF8&psc=1) and a couple packs of [keycaps](https://www.amazon.com/gp/product/B00FZGETVU/ref=ppx_yo_dt_b_asin_title_o00_s01?ie=UTF8&psc=1)

You don't necessarily need to pull the old keys out and put new ones in, but it does look cool to have transparent keys on top of a backlit keypad.  

## Keypad Setup
First, plug in the external keypad. You need to replace the device id in the Lua script with your own device id number.

![Lua device id](https://github.com/anaroar/Stream-Deck/assets/129563507/b54b903b-47f6-484b-8cd4-355c688d809a)

You can find the device id number by opening the Device Manager on your PC, expanding the *Keyboards* drop-down, and right-clicking on the device that you just added (if you're not sure or they're all labeled the same, you can look at the timestamp under the *Events* tab. It will be the one marked with the current date and time). 

The id number you need to copy/paste into the Lua script is usually a string of alphanumeric characters that are between two ampersands.

![Device manager](https://github.com/anaroar/Stream-Deck/assets/129563507/89639c6c-e8c3-407c-a63f-b3e93b5b3175)

In the Lua script, you will need to make a few more changes:
- Replace the path for the *Users* folder with the path for your PC's current user
- Reset each individual key on the external keypad with a name and its event id number

![Lua path and number ids](https://github.com/anaroar/Stream-Deck/assets/129563507/594aa1ce-03c3-4b5e-be06-12adc0024662)

You can find the event id number of each key using HID Macros. Once opened and on the *Macros* tab, it will display the event id of whichever button was last pressed, followed by the corresponding keypad button in parentheses. For example, in the following image, the number *5* button was the last button pressed, and its event id number is *101*.

![HID macros](https://github.com/anaroar/Stream-Deck/assets/129563507/2dd3cc0c-184e-471f-a5fd-01f96e96fc8b)

Once you make these adjustments to the Lua script, your stream deck should be functional and ready to run.

### Macro Setup
You can edit what macros you want to use by editing the AHK script. Open it by right-clicking on the script and selecting *Edit with...* your preferred text editor. For each keypad button named in the Lua file, there should be a corresponding *if* statement in the AHK script that defines what happens when that button is pressed.
To execute a command or perform a function within OBS specifically, you can first define a hotkey in **OBS -> Settings -> Hotkeys**, and then add that hotkey combination to the AHK script.

![OBS](https://github.com/anaroar/Stream-Deck/assets/129563507/9ee95f7c-921c-4240-95db-f07944585157)

![AHK](https://github.com/anaroar/Stream-Deck/assets/129563507/35fd30a0-c45a-43f4-9c6d-f035ede11d08)

## How to Run 
The scripts will run automatically once you add them to the Windows Startup folder. That way, the stream deck will be ready to use every time you power on your computer. To get them added, hit *Windows + R* to open the Run Command dialog box, and type *shell:startup* into the text box.

![Windows + R](https://github.com/anaroar/Stream-Deck/assets/129563507/14ed38b7-a8ca-4f29-8c39-eb359fd551ca)

This will open the Windows Startup folder, where you can add shortcuts to the paths that store your script files. Right-click inside the folder and select **New > Shortcut** to add both the Lua and AHK scripts.

![Shell startup](https://github.com/anaroar/Stream-Deck/assets/129563507/42d97d45-2a8e-47a8-9767-acc9625e5c94)

Now, the scripts should automatically run in the background the next time you restart your computer. If you need to change or update the hotkey functions, you can do so easily by right-clicking the AHK icon in your tray, pausing the script, and resuming again after the changes to your AHK script have been saved. 

