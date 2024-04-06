#!/bin/bash

echo ""
echo "Please select the PC:"
echo ""

# Pre-defined options
opcje=("HP Pro Mini 400 i5" "HP Pro Mini 400 i7" "HP Pro Mini 400 i9")

select opcja in "${opcje[@]}"
do
    case $opcja in
        "HP Pro Mini 400 i5")
            IP="XXX.XXX.X.XX6"
            break
            ;;
        "HP Pro Mini 400 i7")
            IP="XXX.XXX.X.XX5"
            break
            ;;
        "HP Pro Mini 400 i9")
            IP="XXX.XXX.X.X5"
            break
            ;;
        *) echo "Not the right choice $REPLY";;
    esac
done

echo ""
echo "Selected: $IP"
echo ""


# other variables
USERNAME="username"
PASSWORD="password"
DRIVE_PATH="/path/to/local/directory"
DRIVE_NAME="mapped_drive"

# completed command
xfreerdp /v:$IP /u:$USERNAME /p:$PASSWORD /network:auto /gfx /rfx /compression /clipboard /drive:$DRIVE_PATH,$DRIVE_NAME /multimon
