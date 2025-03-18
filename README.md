# Script d'Installation pour Développeur - `setup.sh`

Ce script `setup.sh` permet de configurer un environnement de développement complet sur une machine Linux. Il installe une série d'outils couramment utilisés par les développeurs pour travailler sur des projets web, backend, mobile, et bien d'autres encore.

## 🚀 Fonctionnalités

Le script permet d'installer facilement les outils suivants :

- **Gestion de version** : Git
- **Environnement Web** : Node.js, Nginx, Apache, PHP
- **Environnement Backend** : Python, Java, Composer
- **Bases de données** : MySQL, PostgreSQL, Redis, MongoDB
- **Virtualisation et Conteneurisation** : Docker, Kubernetes, Vagrant, VirtualBox
- **Développement mobile** : Flutter, Android SDK
- **Autres outils utiles** : Vim, Zsh, Tmux, Curl, Htop, Neofetch, etc.

## 🔧 Prérequis

Ce script est conçu pour les systèmes **Ubuntu/Debian**. Il nécessite des privilèges `sudo` pour installer des logiciels.

## 📝 Installation

### 1. Téléchargement du script
Télécharge ce fichier `setup.sh` et rends-le exécutable avec la commande suivante :
`chmod +x setup.sh`

2. Exécution du script
Lance ensuite le script pour démarrer l'installation :
`./setup.sh`

Le script procédera à l'installation des outils définis dans le fichier et te guidera tout au long du processus avec des messages d'état.

📋 Que fait le script ?
Le script exécute plusieurs étapes pour configurer l'environnement de travail :

Création d'une clé SSH : Le script génère une clé SSH et la stocke dans le répertoire ~/sshkeyfile.
Installation de paquets : Il installe une liste de paquets nécessaires pour le développement (Git, Node.js, PHP, MySQL, Docker, etc.).
Configuration de Git : Il te demande ton nom et ton adresse mail pour configurer Git.
Ajout de Visual Studio Code : Le script ajoute le dépôt Microsoft pour Visual Studio Code et l'installe.
Installation de oh-my-zsh : Le script installe et configure oh-my-zsh pour améliorer ton terminal Zsh.
Mise à jour des paquets : Il met à jour et installe les paquets supplémentaires requis par le script.

🧑‍💻 Personnalisation
Tu peux personnaliser ce script en modifiant la liste des paquets dans le tableau packages. Si tu souhaites ajouter ou supprimer des outils, édite simplement cette liste et le script prendra en charge l'installation des nouveaux paquets.

⚠️ Attention
Privilèges sudo : Ce script nécessite des privilèges sudo pour installer des logiciels.
Vérification avant exécution : Avant d'exécuter le script sur une machine de production, il est recommandé de vérifier son contenu.
Connexion Internet : Le script nécessite une connexion Internet pour télécharger les paquets nécessaires.

📚 Auteurs
~ MilesLK ~
