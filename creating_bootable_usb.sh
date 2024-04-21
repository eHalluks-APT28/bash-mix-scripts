#!/bin/bash

# Sprawdzenie dd - w razie co instalacja
if ! command -v dd &> /dev/null; then
    echo "Narzędzie dd nie zostalo znalezione. Instalowanie dd..."
    sudo apt-get install coreutils
fi

# lista urzadzen blokowych
echo "Dostepne urzadzenia: "
lsblk

# pobranie id urzadzenia
read -p "Wpisz identyfikator urządzenia do odmontowania (np. /dev/sdx): " dev
echo "Odmontowywanie urzadzenia $dev..."
for part in $(ls ${dev}*); do
    sudo umount $part 2> /dev/null || echo "Nie mozna odmontować partycji $part"
done

# potwierdzenie
read -p "Czy na pewno chcesz wyczyscic $dev? [y/N]: " response
response=${response:-N}
if [[ "$response" =~ ^[Yy]$ ]]; then
    echo "Czyszczenie $dev..."
    sudo dd if=/dev/zero of=$dev bs=4M status=progress oflag=sync
else
    echo "Anulowano czyszczenie $dev."
    exit 1
fi

# sciezka do pliku iso
read -p "Podaj pelna sciezke do pliku ISO: " iso_path

# test sciezki
if [[ -f "$iso_path" ]]; then
    echo "Zapisywanie obrazu ISO na $dev..."
    sudo dd if="$iso_path" of=$dev bs=4M status=progress oflag=sync
    sync
else
    echo "Plik ISO nie istnieje. Prosze sprawdzic sciezke."
    exit 1
fi

# procesy koncowe
echo "Odmontowywanie urzadzenia $dev..."
sudo umount ${dev}* 2> /dev/null || true
sudo eject $dev

echo "Proces zakonczony pomyslnie. Mozna juz odlaczyc USB"

