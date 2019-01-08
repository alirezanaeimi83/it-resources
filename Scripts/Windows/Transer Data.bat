REM Transfer all data from <source> to <destination>
REM Author: Justin Chapdelaine
REM Version: 20190107.01
REM Source: https://github.com/justinchapdelaine/latteit

@echo off

REM Reset variables
SET confirm=n

REM Get source destination
SET /p "source=Enter Source: "
SET /p "destination=Enter Destination: "
SET /p "confirm=Is source and destination correct? [y/n]: "

IF not %confirm%==y exit

robocopy "%source%" "%destination%" /E /R:3 /W:1 /MT:16 /V /TEE /LOG:"%destination%"\Backup.log

PAUSE
