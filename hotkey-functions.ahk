#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance force

SetNumLockState, AlwaysOn
SetKeyDelay, 0, 10

; tooltip
tippy(tipsHere, wait := 333)
{
    ToolTip, %tipsHere%
    SetTimer, noTip, %wait% ; in 1/3 seconds by default, remove the tooltip
}
noTip:
    ToolTip,
return

F24::

FileRead, key, C:\Users\anaro\Documents\keypressed.txt

tippy(key)

if (key = "escape") ; start OBS
    {
		if WinExist("Streamlabs Desktop")
			WinActivate
		else
			Run, "C:\Program Files\Streamlabs OBS\Streamlabs OBS.exe"
	}
else if (key = "calc") ; empty
    {}
else if (key = "tab") ; open Twitch
    Run, https://dashboard.twitch.tv/stream-manager
else if (key = "equals") ; start Steam
	{
		if WinExist("Steam")
			WinActivate
		else
			Run, "C:\Program Files (x86)\Steam\steam.exe"
	}
else if (key = "numLock") ; empty
    {}
else if (key = "slash") ; start Spotify from taskbar
    SendInput, #5
else if (key = "asterisk") ; start Discord from taskbar
	SendInput, #9
else if (key = "backspace") ; open closed captioning
    Run, https://cc.alejo.io/recorder
else if (key = "num7") ; empty
    {}
else if (key = "num8") ; skip song in Spotify
    {
		#IfWinExist Spotify
			SendInput, {Media_Next}
	}
else if (key = "num9") ; generate random question of the day 
    {
		Loop
			{
				{
					Loop, read, C:\Users\anaro\Desktop\Streamdeck\questions.txt
						{
							question%A_index% := A_LoopReadLine
							maxquestion := A_index
						}
					Random, number, 1, %maxquestion%
					MsgBox, 5, Random Question Generator, % question%number%
				}
			IfMsgBox, Retry
				Continue
			IfMsgBox Cancel
				Break
			}
	}
else if (key = "minus") ; starting soon in OBS
    {
		#IfWinExist Streamlabs Desktop
			SendInput, {ctrl down}{1 down} ; starting soon scene
			Sleep, 100
			SendInput, {ctrl up}{1 up}
			Sleep, 100
			SendInput, {ctrl down}{5 down} ; mute mic
			Sleep, 100
			SendInput, {ctrl up}{5 up}
			Sleep, 100
			SendInput, {ctrl down}{7 down} ; start stream
			Sleep, 100
			SendInput, {ctrl up}{7 up}
	}
else if (key = "num4") ; empty
    {}
else if (key = "num5") ; empty
    {}
else if (key = "num6") ; empty
    {}
else if (key = "plus") ; start stream in OBS 
    {
		#IfWinExist Streamlabs Desktop
			SendInput, {ctrl down}{6 down} ; unmute mic
			Sleep, 100
			SendInput, {ctrl up}{6 up}
			Sleep, 100
			SendInput, {ctrl down}{2 down} ; live scene
			Sleep, 100
			SendInput, {ctrl up}{2 up}
	}
else if (key = "num1") ; empty
    {}
else if (key = "num2") ; empty
    {}
else if (key = "num3") ; empty
    {}
else if (key = "enter") ; stop stream in OBS
    {
		#IfWinExist Streamlabs Desktop
			SendInput, {ctrl down}{3 down} ; end scene
			Sleep, 100
			SendInput, {ctrl up}{3 up}
			Sleep, 100
			SendInput, {ctrl down}{8 down} ; stop stream
			Sleep, 100
			SendInput, {ctrl up}{8 up}
	}
else if (key = "num0") ; create clip of last 20 seconds
    {
		#IfWinExist Streamlabs Desktop
			SendInput, {ctrl down}{shift down}{s down} ; save clip
			Sleep, 100
			SendInput, {ctrl up}{shift up}{s up}
	}
else if (key = "period") ; pause stream in OBS
    {
		#IfWinExist Streamlabs Desktop
			SendInput, {ctrl down}{5 down} ; mute mic
			Sleep, 100
			SendInput, {ctrl up}{5 up}
			Sleep, 100
			SendInput, {ctrl down}{4 down} ; pause scene
			Sleep, 100
			SendInput, {ctrl up}{4 up}
	}
else
    MsgBox, , Uh-oh! This button is not yet assigned: %key%,