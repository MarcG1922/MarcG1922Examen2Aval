#!/bin/bash

archivo="consumos.txt"
ciudad=$(head -n 1 "$archivo" | cut -d ',' -f 1)

max_consumo=$(tail -n +2 "$archivo" | cut -d ',' -f 2 | sort -nr | head -n 1)
min_consumo=$(tail -n +2 "$archivo" | cut -d ',' -f 2 | sort -n | head -n 1)

mes_max=$(grep "$max_consumo" "$archivo" | cut -d ',' -f 2)
ano_max=$(grep "$max_consumo" "$archivo" | cut -d ',' -f 3)
mes_min=$(grep "$min_consumo" "$archivo" | cut -d ',' -f 2)
ano_min=$(grep "$min_consumo" "$archivo" | cut -d ',' -f 3)

echo "Ciudad: $ciudad"
echo "Máximo consumo: $max_consumo , Mes: $mes_max, Año: $ano_max"
echo "Mínimo consumo: $min_consumo , Mes: $mes_min, Año: $ano_min"
