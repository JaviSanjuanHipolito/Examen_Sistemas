#!/bin/bash
total() {
    ciudad="$1"
    total=0

    while IFS= read -r line; do
        ciudad_linea=$(echo "$line" | awk '{print $1}')
        if [ "$ciudad" == "$ciudad_linea" ]; then
            consumo=$(echo "$line" | awk '{print $4}')
            total=$((total + consumo))
        fi
    done < consumo.txt

    echo "El total de consumo en $ciudad es: $total"
}

echo "di un nombre de ciudad:"
read ciudad

while ! grep -q "$ciudad" consumo.txt; do
    echo "No hay ninguna con ese nombre intentalo de nuevo:"
    read ciudad
done
total "$ciudad"