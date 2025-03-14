#!/bin/bash

# Vérification de la présence de dnsutils
    echo "Vérification de la présence du paquet dnsutils..."
 if dpkg -l | grep -q dnsutils ; then
    echo "Le paquet dnsutils est installé."
 else 
    echo "dnsutils n'est pas installé mais TQT je m'en charge"
     # Installation de dnsutils
    echo "Démarrage de l'installation de dnsutils" 
    sudo apt-get install dnsutils
    echo "pacquet bien installé"
fi 

# Ensuite j'utilise la commande qui affichera les informations dns
read -p "Veuillez saisir votre recherche: " domain

if [[ -z "$domain" ]]; then
    echo "Nom de domaine non valide :("
    exit 1
else
    echo "Recherche d'informations en cours..."
    dig -x $domain
    echo "Recherche terminée!"
fi
