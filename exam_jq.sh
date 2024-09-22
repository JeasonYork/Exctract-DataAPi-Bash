#!/bin/bash

echo "1. Affichez le nombre d'attributs par document ainsi que l'attribut name"
cat people.json | jq '.[] | {num_attributes: length, name}'
echo "Commande : cat people.json | jq '.[] | {num_attributes: length, name}'"
echo "Réponse : il y a 17 attributs par document"
echo -e "\n---------------------------------\n"

echo "1.  N'affichez que les 12 premières lignes avec la commande head (notebook #2)."
cat people.json | jq '.[:12] | .[] | {num_attributes: length, name}'
echo "Commande : cat people.json | jq '.[:12] | .[] | {num_attributes: length, name}'"
echo "Réponse : "
echo -e "\n---------------------------------\n"

echo "2. Combien y a-t-il de valeur unknown pour l'attribut birth_year ?"
cat people.json | jq '[.[] | select(.birth_year == "unknown")] | length' | tail -n 1
echo "Commande : cat people.json | jq '[.[] | select(.birth_year == "unknown")] | length' | tail -n 1"
echo "Réponse : il y a 42 resultats avec une date = unknown"
echo -e "\n---------------------------------\n"

echo "3. Affichez la date de création de chaque personnage et son nom. La date de création doit être de cette forme : l'année, le mois et le jour. N'affichez que les 10 premières lignes. (Pas de Réponse attendue)"
cat people.json | jq -c '.[] | {name: .name, dateCreation: (.created | sub("\\.[0-9]+Z$"; "Z") | strptime("%Y-%m-%dT%H:%M:%SZ") | strftime("%Y-%m-%d"))}' | head -n 10
echo "Commande : cat people.json | jq -c '.[] | {name: .name, dateCreation: (.created | sub("\\.[0-9]+Z$"; "Z") | strptime("%Y-%m-%dT%H:%M:%SZ") | strftime("%Y-%m-%d"))}' | head -n 10"
echo "Réponse : "
echo -e "\n---------------------------------\n"

echo "4. Certains personnages sont nés en même temps. Retrouvez toutes les pairs d'ids (2 ids) des personnages nés en même temps."
cat people.json | jq 'group_by(.birth_year) | map(select(length > 1) | { birth_year: .[0].birth_year, ids: map(.id) })'
echo "Commande : cat people.json | jq 'group_by(.birth_year) | map(select(length > 1) | { birth_year: .[0].birth_year, ids: map(.id) })'"
echo "Réponse : cette commande nous retourne la liste des ID qui partagent le même birth_year"
echo -e "\n---------------------------------\n"

echo "5. Renvoyez le numéro du premier film (de la liste) dans lequel chaque personnage a été vu suivi du nom du personnage. N'affichez que les 10 premières lignes."
cat people.json | jq 'map({name: .name, first_film: (.films[0] | match("\\/([0-9]+)\\/").captures[0].string)}) | .[:10]'
# ...echo "Commande : cat people.json | jq 'map({name: .name, first_film: (.films[0] | match("\\/([0-9]+)\\/").captures[0].string)}) | .[:10]'"
echo "Commande : cat people.json | jq 'map({name: .name, first_film: (.films[0] | match(\"\\/([0-9]+)\\/\").captures[0].string)}) | .[:10]'"
echo "Réponse : "
echo -e "\n---------------------------------\n"

echo -e "\n----------------BONUS----------------\n"

echo "7.Transformer l'attribut height en nombre."
jq 'map(.height |= tonumber) | .' people.json > bonus/people_7.json
echo "Commande : jq 'map(.height |= tonumber) | .' people.json > bonus/people_7.json"
echo "Réponse : "
echo -e "\n---------------------------------\n"

echo "8. Ne renvoyez que les personnages dont la taille est entre 156 et 171."
cat people.json | jq 'map(select(.height | tonumber >= 156 and tonumber <= 171))' > bonus/people_8.json
echo "Commande : cat people.json | jq 'map(select(.height | tonumber >= 156 and tonumber <= 171))' > bonus/people_8.json"
echo "Réponse : "
echo -e "\n---------------------------------\n"

echo "9. Renvoyez le plus petit individu de people_8.json et affichez cette phrase en une seule commande"
cat bonus/people_8.json | jq -r 'min_by(.height) | "\(.name) is \(.height) tall"' > bonus/people_9.txt
echo "Commande : cat bonus/people_8.json | jq -r 'min_by(.height) | "\(.name) is \(.height) tall"' > bonus/people_9.txt"
echo "Réponse : "
echo -e "\n---------------------------------\n"
