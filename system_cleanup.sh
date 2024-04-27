#!/bin/bash

execute_command() {
    local command=$1
    local message=$2

    echo "Rozpoczynam: $message..."

    if [[ $command == *"dpkg --purge"* ]]; then
        local packages_to_remove=$(dpkg -l | grep '^rc' | awk '{print $2}')
        if [ -z "$packages_to_remove" ]; then
            echo "Nie ma konfiguracji niezainstalowanych pakietow do usuniecia."
            echo " "
            return 0
        fi
    fi

    # Wykonanie polecenia
    $command >/dev/null 2>&1
    local status=$?
    if [ $status -eq 0 ]; then
        echo "$message [OK] ukonczone."
    else
        echo "Blad przy wykonywaniu: $message!"
    fi
    echo " "
}


execute_command "sudo dpkg --purge $(dpkg -l | grep '^rc' | awk '{print $2}')"
execute_command "sudo apt autoremove" "Usuwanie niepotrzebnych pakietow"
execute_command "sudo apt autoclean" "Czyszczenie starego cache pakietow"
execute_command "sudo apt clean" "Czyszczenie wszystkiego cache pakietow"
execute_command "sudo resolvectl flush-caches" "Czyszczenie cache DNS"

echo "Proces czyszczenia zakonczony"
echo " "


