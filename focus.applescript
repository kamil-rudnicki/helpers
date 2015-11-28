aunch application "Spotify"

tell application "Messages"
    set status to away
    set status message to "Busy. Leave a message"
end tell

tell application "Skype"
	send command "SET USERSTATUS DND" script name "SKYPE STATUS"
end tell

tell application "System Events" to tell UI element "HipChat" of list 1 of process "Dock"
  perform action "AXShowMenu"
  delay 0.5
  click menu item "Status" of menu 1
  click menu item "Do Not Disturb" of menu 1 of menu item "Status" of menu 1
end tell

quit application "Mail"
quit application "feedly"

tell application "System Events" to tell process "SystemUIServer"
  key down option
  click menu bar item 1 of menu bar 2
  key up option
end tell

tell application "Spotify"
	set shuffling to true
end tell

tell application "Spotify"
	play track "spotify:user:widget102:playlist:0cxClMsW3W1gW8eNccPHSF"
end tell
