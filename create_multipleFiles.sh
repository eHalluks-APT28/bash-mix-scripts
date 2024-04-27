#!/bin/bash

boldGreen="\e[1;92m"
red="\e[1;91m"
endcolor="\e[0m"

echo " "
echo "========================================================"
echo " "
echo "  Author: eHalluks"
echo "  Sys: Ubuntu 24.04 LTS"
echo " "
echo "  Tips:"
echo " "
echo "  0.) Przerwanie skryptu za pomocą CTRL+C"
echo "  1.) Możesz użyć tilde expansion przy podaniu ścieżki"
echo "  2.) Wprowadzona nazwa rozszerzenia nie może zawierać '.'"
echo "  3.) Nie można wprowadzić nazwy pliku jako liczba '0'"
echo "  4.) Skrypt zawiera jedynie podstawową walidację"
echo -e "  5.) Nazwa pliku musi zawierać min. jeden znak\n  oraz nie może zawierać m.in. '.' w nazwie."
echo " "
echo "========================================================"
echo " "

validate_input() {
    if [[ -z $1 ]]; then
        echo -e "${red}  [ERROR] Nie wprowadzono zadnej wartosci${endcolor}"
        echo " "
        return 1
    elif [[ $1 == "~" ]]; then
        echo -e "${red}  [ERROR] Nie uzywaj '~'\n  W przypadku sciezki uzyj poprawnie tilde expansion${endcolor}"
        echo " "
        return 1
    fi
    return 0
}

validate_extension() {
    if [[ $1 =~ [^a-zA-Z0-9_-] ]]; then
        echo " "
        echo -e "${red}[ERROR] Nazwa pliku moze zawierac tylko ^a-zA-Z0-9_-${endcolor}"
        return 1
    fi
    return 0
}

while true; do

echo "Podaj sciezke do katalogu: ('1' = pwd)"
read directory

if [[ "$directory" == "1" ]]; then
    directory=$(pwd)
else
    directory="${directory##+([[:space:]])}"
    directory="${directory%%+([[:space:]])}"
    if [[ "$directory" == \~* ]]; then
        directory=$(eval echo $directory)
    fi
fi

validate_input "$directory" || exit

mkdir -p "$directory"

    
    echo " "
    echo "Ustaw generyczne rozszerzenie ('nie' = rezygnacja):"
    read extension
    echo " "
    
    extension="${extension#.}"
    extension="${extension##+([[:space:]])}"
    extension="${extension%%+([[:space:]])}"
    
    validate_input "$extension" || exit
    
    if [[ $extension != "nie" ]]; then
    echo "Ustawiono generyczne rozszerzenie plikow: .$extension"
    else
    echo -e "${red}[!] Pamietaj o dodawaniu rozszerzenia do nazwy${endcolor}"
    fi
    
    firstTime=true
    
    echo " "
    while true; do
        if [[ $firstTime == true ]]; then
    echo "Podaj nazwe pliku ('0' = zakonczenie wprowadznia):"
    firstTime=false
    else
    echo " "
    echo "Kolejna nazwa:"
    fi
    
    read filename
    
    validate_input "$filename" || continue
    
    if [[ $filename == "0" ]]; then
    echo " "
    echo "Proces tworzenia plikow zostal pomyslnie zakonczony"
    echo " "    
    tree -L 2 $directory    
    break
    fi
    
    if [[ $extension == "nie" ]]; then
    validate_extension "$filename" || continue
    base_name="${filename%.*}"
    file_extension="${filename##*.}"
    filepath="$directory/$filename"
    else
    base_name="$filename"
    filepath="$directory/$base_name.$extension"
    fi
    
    if [[ ! -e "$filepath" ]]; then
    touch "$filepath"
    echo -e "${boldGreen}[OK] Utworzono plik${endcolor}"
    else
    counter=1
    while [[ -e "$filepath" ]]; do
        filepath="${directory}/${base_name}_${counter}.$extension"
        ((counter++))
        done
    touch "$filepath"
    echo -e "${boldGreen}[OK] Utworzono plik{endcolor}"
    fi
    done
    echo " " 
    echo "Czy chcesz zmienic sciezke do katalogu i wprowadzac dalej? (y/n):"
    read answer
    if [[ "$answer" != "y" ]]; then
        echo " "
        echo "Dzialanie skryptu zostalo zakonczone pomyslnie."
        echo " "    
        break
    fi
    
done
