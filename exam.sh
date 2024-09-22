#!/bin/bash

# URL de l'api de récupération des ventes
SALES_URL="http://0.0.0.0:5000"

# Nom du fichier de sortie (ventes)
SALES_FILE="/home/ubuntu/exam_CHAHET/exam_bash/sales.txt"

# Fonction pour récupérer les ventes pour une carte graphique donnée reçu en parametre
get_sales() {
    local card="$1"
    local sales_count=$(curl -s "${SALES_URL}/${card}")
    echo "${card}:${sales_count}"
}


# Écrire la date dans le fichier de sortie (liste des ventes)
echo "$(date)" >> "$SALES_FILE"

# Création d'un variable avec la liste des cartes graphiques à surveiller
graphics_cards=("rtx3060" "rtx3070" "rtx3080" "rtx3090" "rx6700")

# Récupérer les ventes pour chaque carte graphique de la liste graphics_cards
for card in "${graphics_cards[@]}"; do
    sales_info=$(get_sales "$card")
    echo "$sales_info" >> "$SALES_FILE"
done
