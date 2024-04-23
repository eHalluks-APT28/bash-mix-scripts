#!/bin/bash

boldGreen="\e[1;92m"
blue="\e[34m"
red="\e[1;91m"
endcolor="\e[0m"

echo " " 
echo "=====STEP1=======" 
echo -e "${boldGreen}[x] Podaj sciezke do katalogu, gdzie bedzie utworzony projekt\n[x] ** Nie uzywaj tyldy **\n[x] Przykladowa sciezka: /home/username/your_project_dir_name ${endcolor}"
echo " "

# path validator
while true; do
    read base_path
    base_path=$(echo "$base_path" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
    if [[ "$base_path" == "0" ]]; then
        echo "Anulowano proces."
        exit 0
    elif [[ -d "$base_path" ]]; then
        break
    else
        IFS='/' read -ra ADDR <<< "$base_path"
        if [[ -d "/${ADDR[1]}/${ADDR[2]}" ]]; then
	   echo " "
            echo -e "${red}[x] [!] Bazowy katalog istnieje. Utworze brakujący katalog '$base_path' ${endcolor}"
            mkdir -p "$base_path"
            break
        else
            echo " "
            echo -e "${red}[!] Bazowy katalog nie istnieje. Podaj prawidlowa sciezke${endcolor}"
        fi #
    fi 
    echo -e "${red}Podaj prawidlowa sciezke lub wpisz 0 aby wyjsc:${endcolor}"
done
echo "================"

echo " "
echo "=====STEP2======="
echo -e "${boldGreen}[x] Podaj nazwe projektu:${endcolor}"
echo " "
read project_name
project_name=$(echo "$project_name" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
echo "================="

cd "$base_path"

echo " "
echo "=====STEP3======="
# install vite 
echo -e "${blue}[x] Wybrano YARN do instalacji. Typ instalacji: Interactive${endcolor}"
echo " "
yarn create vite "$project_name"
cd "$project_name"
full_path=$(pwd)
echo " "
echo -e "${blue}[x] Instalacja projektu: '$project_name' w lokalizacji: '$full_path' \nzostała pomyślnie zakończona${endcolor}"
echo "================="

echo " "
echo "=====STEP4======="
echo -e "${blue}[x] Instalacja zależności...${endcolor}"
echo " "
yarn install
yarn add scss --dev
yarn add @types/sass --dev 
echo " "
echo -e "${blue}[x] Zainstalowano${endcolor}"
echo "================="


# files validator
src_path="./src"
if [[ ! -d "$src_path/assets" || ! -f "$src_path/App.css" || ! -f "$src_path/App.tsx" || ! -f "$src_path/index.css" ]]; then
    echo " "
    echo "=====STEP5======="
    echo -e "${red}[x] Nie znaleziono wymaganych plików lub katalogów w $src_path. Sprawdź, czy projekt zawiera wszystkie wymagane elementy${endcolor}"
    echo " "
    exit 1 
fi

echo " "
echo "=====STEP5======="
rm -rf "./public" 
rm -rf "$src_path/assets" "$src_path/App.css" "$src_path/App.tsx" "$src_path/index.css"
echo -e "${blue}[x] Usunięto zbędne pliki oraz katalogi${endcolor}"
echo "================="

mkdir -p "$src_path/components"

clear
# components loop
counter=0
while true; do
    
    if [ $counter -eq 0 ]; then 
        echo " "
        echo "=====STEP6======="
        echo -e "${boldGreen}[x] Stworz nowy komponent( dir, .tsx, .scss ) wprowadzajac tylko nazwe. 0 = konczy petle:${endcolor}"
    else
        echo -e "${boldGreen}[x] Podaj kolejną nazwe:${endcolor}"
    fi
    read component_name

    # break if 0
    if [ "$component_name" = "0" ]; then
        break
    fi

    # check if name is not empty
    if [ -z "$component_name" ]; then
        echo -e "${red}Nazwa komponentu nie moze byc pusta!${endcolor}"
        continue
    fi

    # valid first letter
    formatted_name="$(tr '[:lower:]' '[:upper:]' <<< ${component_name:0:1})${component_name:1}"

    # creating dir, tsx, scss
    component_dir="$src_path/components/$formatted_name"
    mkdir -p "$component_dir"
    touch "$component_dir/$formatted_name.tsx"
    touch "$component_dir/$formatted_name.scss"
    echo -e "${blue}Utworzono komponent '$formatted_name'${endcolor}"
    echo " "

    counter=$((counter + 1))
done
echo "================="


echo " "
echo "=====STEP7======="
echo -e "${blue}[x] Proces tworzenia komponentow zostal zakonczony. Oto struktura projektu:${endcolor}"
echo " "
tree -I node_modules "$full_path"
echo " "

echo " "
echo "=====STEP8======="
echo -e "${blue}[x] Edycja plikow po usunieciu boilerplate${endcolor}"
sed -i '/import App from *'\''\.\/App\.tsx'\''/d' "$base_path/$project_name/src/main.tsx"
sed -i '/import *'\''\.\/index\.css'\''/d' "$base_path/$project_name/src/main.tsx"
sed -i 's/<App \/>/<h1> Testowe uruchomienie zakończony pomyślnie <\/h1>/' "$base_path/$project_name/src/main.tsx"
sed -i '/<link rel="icon" type="image\/svg+xml" href="\/vite.svg" \/>/d' "$base_path/$project_name/index.html"
sed -i 's/<title>Vite + React + TS<\/title>/<title>Test | passed<\/title>/' "$base_path/$project_name/index.html"
sed -i '/"compilerOptions": {/a \    "allowSyntheticDefaultImports": true,' "$base_path/$project_name/tsconfig.json"
sed -i 's/"dev": "vite"/"dev": "vite --open"/' "$base_path/$project_name/package.json"
echo "================="
echo " "

cd "$base_path/$project_name"

echo " "
echo "=====STEP9======="
echo -e "${blue}[x] Uruchomienie testowe...${endcolor}"
echo " "
yarn dev
echo "================="
echo " "

