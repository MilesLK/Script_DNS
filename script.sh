#!/bin/bash
echo "Vous avez lancé l'installation de la configuration de votre environnement de travail...."
echo "Création du fichier de stockage de la clé SSH..."
mkdir sshkeyfile
echo "Création du dossier terminé."
echo "Génération de la clé SSH"
ssh-keygen -t ed25519 -f ~/sshkeyfile/sshkey
echo "Génération terminé chemin pour retrouver votre clé '~/sshfile/sshkey.txt' "

sudo apt update

# Définition de la liste des paquets à installer
packages=("git" "wget" "curl" "vim" "zsh" "tmux"
          "nodejs" "npm" "yarn" "apache2" "nginx"
          "php" "composer" "python3" "python3-pip" "openjdk-17-jdk"
          "mysql-server" "postgresql" "sqlite3" "redis" "mongodb-org"
          "docker.io" "docker-compose" "kubectl" "vagrant" "virtualbox"
          "android-sdk" "flutter" "adb" "fastboot"
          "htop" "neofetch" "net-tools" "gnome-tweaks")

echo "Début de l'installation des paquets..."

for package in "${packages[@]}"; do
    echo "Installation de $package..."
    sudo apt -y install "$package"
    echo "$package installé avec succès !"
done

echo "Installation des paquets terminée ! 🚀"


# Configuration de votre git
read -p "Veuillez saisir votre nom:" nom
git config --global user.name "$nom"
read -p "Veuillez saisir votre adresse mail:" mail
git config --global user.email "$mail"

# Téléchargement de la clé publique Microsoft et la convertir au format gpg.
echo "Téléchargement de clé publique Microsoft et conversion au format gpg...."
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg

# Installation la clé GPG sur la machine locale, en définissant le répertoire dans laquelle la stocker,ainsi que des permissions.
echo "Installation de la clé GPG..."
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg

# Ajoutez le dépôt de Microsoft aux sources pour APT afin de pouvoir récupérer le paquet de Visual Studio Code.
echo "Ajout du dépôt de Microsoft aux sources..."
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null

# Suppression le fichier temporaire de la clé GPG téléchargée précédemment.
echo "Suppression du fichier temporaire de la clé GPG..."
rm -f packages.microsoft.gpg

echo "Suppression du fichier temporaire de la clé GPG..."
sudo apt -y install apt-transport-https
sudo apt -y install code

# Installation de oh-my-zsh
echo "Installation de zsh"
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

echo "Votre environnement de travail à bien été configuré."
