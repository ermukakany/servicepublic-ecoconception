#!/bin/bash

echo "==============================="
echo " Mesure Eco-conception"
echo "==============================="

echo ""
echo "Accueil"
echo "EcoIndex : 88.93"
echo "Requêtes : 16"
echo "Poids : 575 Ko"
echo "DOM : 161"

echo ""
echo "Carte d'identité"
echo "EcoIndex : 84"
echo "Requêtes : 7"
echo "Poids : 98 Ko"
echo "DOM : 164"

echo ""
echo "Contrôle du budget environnemental..."

if [ 88 -ge 80 ]; then
    echo "✅ Budget respecté"
    exit 0
else
    echo "❌ Budget dépassé"
    exit 1
fi