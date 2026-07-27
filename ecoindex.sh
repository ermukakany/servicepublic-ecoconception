#!/bin/bash

echo "==============================="
echo " Mesure Eco-conception"
echo "==============================="

# -------------------------
# Vérification du fichier
# -------------------------

if [ ! -f "ecoindex-results.json" ]; then
    echo "❌ Fichier ecoindex-results.json introuvable"
    exit 1
fi

# -------------------------
# Récupération des résultats
# -------------------------

RESULTATS=$(tail -n 1 ecoindex-results.json)

POIDS=$(echo "$RESULTATS" | cut -d',' -f4)
DOM=$(echo "$RESULTATS" | cut -d',' -f5)
REQUETES=$(echo "$RESULTATS" | cut -d',' -f6)
GRADE=$(echo "$RESULTATS" | cut -d',' -f7)
ECOINDEX=$(echo "$RESULTATS" | cut -d',' -f8)
GES=$(echo "$RESULTATS" | cut -d',' -f9)
EAU=$(echo "$RESULTATS" | cut -d',' -f10)

echo ""
echo "Résultats réels EcoIndex"
echo "EcoIndex : $ECOINDEX"
echo "Grade : $GRADE"
echo "Requêtes : $REQUETES"
echo "Poids : $POIDS Ko"
echo "DOM : $DOM"
echo "GES : $GES gCO₂e"
echo "Eau : $EAU cl"

# -------------------------
# Budget environnemental
# -------------------------

BUDGET=88

echo ""
echo "Contrôle du budget environnemental..."
echo "EcoIndex mesuré : $ECOINDEX"
echo "Budget minimum : $BUDGET"

# -------------------------
# Détection de régression
# -------------------------

if awk "BEGIN {exit !($ECOINDEX < $BUDGET)}"; then
    echo "❌ Régression détectée : budget dépassé"
    exit 1
else
    echo "✅ Budget respecté"
    exit 0
fi