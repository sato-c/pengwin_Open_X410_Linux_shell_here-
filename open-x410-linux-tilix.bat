@echo off

REM ### Start X410 in Windowed Apps Mode. If X410 is already running in Desktop Mode, 
REM ### it'll be terminated first without any warning message box.

start /B x410.exe /wm

REM ### Setup a D-Bus instance that will be shared by all X-Window apps

pengwin.exe run "sh -ic 'if [ -z \"(pidof dbus-launch)\" ]; then set -U DISPLAY=127.0.0.1:0.0; dbus-launch --exit-with-x11; fi;'"

REM ### Go to the selected folder path and open your terminal app

pengwin.exe run "cd (wslpath '%1'); exec tilix --display=:0.0 &"
