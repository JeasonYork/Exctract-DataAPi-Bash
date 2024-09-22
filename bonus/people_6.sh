#!/bin/bash

echo "Supprimez les documents lorsque l'attribut height n'est pas un nombre."

jq 'map(select(.height | test("^[0-9]+$"))) | .' people.json > temp_people.json
mv temp_people.json people.json
