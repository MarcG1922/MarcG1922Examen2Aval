#!/bin/bash
while true; do
    read -p "De que ciudad te gustaria ver los consumos? : " ciudad
    if grep -q "$ciudad" consumos.txt; then
        break
    else
        echo "Ciudad $ciudad no encontrada, por favor introduce otra ciudad."
    fi
done

total=$(grep "$ciudad" consumos.txt | awk '{ sum += $4 } END { print sum }')

echo "El consumo total de $ciudad es $total ."