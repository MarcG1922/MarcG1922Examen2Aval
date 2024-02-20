#!bin/bash

ciudad_menor=$(head -n 1 consumos.txt | cut -d' ' -f1)
media_menor=$(cmedia.sh $ciudad_menor)

while IFS= read -r line; do
    ciudad=$(echo $line | cut -d' ' -f1)
    media=$(cmedia.sh $ciudad)

    if (( $(echo "$media < $media_menor" | bc -l) )); then
        ciudad_menor=$ciudad
        media_menor=$media
    fi
done < "consumos.txt"

echo "La ciudad con la media de consumo más baja es: $ciudad_menor, con un valor de: $media_menor"