#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

:*:]d::
FormatTime, CurrentDateTime,, yyyy/M/d  
SendInput %CurrentDateTime%
return 

:*:]dt::
FormatTime, CurrentDateTime,, yyyy/M/d h:mm  ; 看起来会像 9/1/2005 3:53 PM 这样
SendInput %CurrentDateTime%
return

:?:ta::haha

+Space::
send, &nbsp;
return