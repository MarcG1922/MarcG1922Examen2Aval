#!/bin/bash

while true; do
    read -p "De que ciudad te gustaria ver las medias de consumos? : " ciudad
    if grep -q "$ciudad" consumos.txt; then
        break
    else
        echo "Ciudad $ciudad no encontrada, por favor introduce otra ciudad."
    fi
done

suma=$(grep "$ciudad" consumos.txt | cut -d' ' -f4 | paste -sd+ | bc)

cantidad=$(grep "$ciudad" consumos.txt | wc -l)

media=$(echo "scale=2; $suma / $cantidad" | bc)

if (( $(echo "$media < 400" | bc -l) )); then
   echo "La ciudad $ciudad tiene una calificación eco de: ECO"
else
   echo "La ciudad $ciudad tiene una calificación eco de: NO ECO"
fi