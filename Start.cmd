@echo off
cd /D %~dp0%
echo.Run dir: %cd%
".\java\bin\java.exe" -cp ./onekey-libraries/* net.mamoe.mirai.console.terminal.MiraiConsoleTerminalLoader
pause