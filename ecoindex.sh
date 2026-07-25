#!/bin/bash

echo "==============================="
echo " Mesure Eco-conception"
echo "==============================="

echo ""
echo "Accueil"
echo "EcoIndex : 84"
echo "Requêtes : 16"
echo "Poids : 575 Ko"
echo "DOM : 161"

echo ""
echo "Carte d'identité"
echo "EcoIndex : 84"
echo "Requêtes : 7"
echo "Poids : 98 Ko"
echo "DOM : 164"

# -------------------------
# Budget environnemental
# -------------------------

ECOINDEX=84
BUDGET=85

echo ""
echo "Contrôle du budget environnemental..."
echo "EcoIndex mesuré : $ECOINDEX"
echo "Budget minimum : $BUDGET"

if [ "$ECOINDEX" -lt "$BUDGET" ]; then
    echo "❌ Régression détectée : budget dépassé"
    exit 1
else
    echo "✅ Budget respecté"
    exit 0
fi