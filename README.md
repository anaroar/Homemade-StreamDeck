# Homemade Stream Deck
![streamdeck collage](https://github.com/anaroar/Homemade-StreamDeck/assets/129563507/abeaf7b5-8384-4d4c-b81b-e1a1ff30137b)
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

![Lua device id](https://github.com/anaroar/Homemade-StreamDeck/assets/129563507/d1420b76-798c-44f1-83ff-f4d295ee9c91)

You can find the device id number by opening the Device Manager on your PC, expanding the *Keyboards* drop-down, and right-clicking on the device that you just added (if you're not sure or they're all labeled the same, you can look at the timestamp under the *Events* tab. It will be the one marked with the current date and time). 

The id number you need to copy/paste into the Lua script is usually a string of alphanumeric characters that are between two ampersands.

![Device manager](https://github.com/anaroar/Homemade-StreamDeck/assets/129563507/32fe35a6-719a-424c-b021-321eba071d2a)

In the Lua script, you will need to make a few more changes:
- Replace the path for the *Users* folder with the path for your PC's current user
- Reset each individual key on the external keypad with a name and its event id number

![Lua path and number ids](https://github.com/anaroar/Homemade-StreamDeck/assets/129563507/a37e01f3-145b-4360-8283-5276dc880ea9)

You can find the event id number of each key using HID Macros. Once opened and on the *Macros* tab, it will display the event id of whichever button was last pressed, followed by the corresponding keypad button in parentheses. For example, in the following image, the number *5* button was the last button pressed, and its event id number is *101*.

![HID macros](https://github.com/anaroar/Homemade-StreamDeck/assets/129563507/e6308e4f-fb16-4846-b1a3-706171101de2)

Once you make these adjustments to the Lua script, your stream deck should be functional and ready to run.

### Macro Setup
You can edit what macros you want to use by editing the AHK script. Open it by right-clicking on the script and selecting *Edit with...* your preferred text editor. For each keypad button named in the Lua file, there should be a corresponding *if* statement in the AHK script that defines what happens when that button is pressed.
To execute a command or perform a function within OBS specifically, you can first define a hotkey in **OBS -> Settings -> Hotkeys**, and then add that hotkey combination to the AHK script.

![OBS](https://github.com/anaroar/Homemade-StreamDeck/assets/129563507/4ece9907-291b-475a-ad8c-7b96d699fede)

![AHK](https://github.com/anaroar/Homemade-StreamDeck/assets/129563507/d5a15a89-80a9-45f6-9bab-987583702858)

## How to Run 
The scripts will run automatically once you add them to the Windows Startup folder. That way, the stream deck will be ready to use every time you power on your computer. To get them added, hit *Windows + R* to open the Run Command dialog box, and type *shell:startup* into the text box.

![Windows + R](https://github.com/anaroar/Homemade-StreamDeck/assets/129563507/894810e4-ecfb-4919-9722-0d0517267c4f)

This will open the Windows Startup folder, where you can add shortcuts to the paths that store your script files. Right-click inside the folder and select **New > Shortcut** to add both the Lua and AHK scripts.

![Shell startup](https://github.com/anaroar/Homemade-StreamDeck/assets/129563507/8f3a8d17-14ba-4632-854e-0172d671b7ea)

Now, the scripts should automatically run in the background the next time you restart your computer. If you need to change or update the hotkey functions, you can do so easily by right-clicking the AHK icon in your tray, pausing the script, and resuming again after the changes to your AHK script have been saved. 

