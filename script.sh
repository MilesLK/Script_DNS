#!/bin/bash
echo "Bienvenue dans votre configurateur d'environnement de travail :)"


#1 Question
echo "Souhaitez vous générer une clé SSH sur votre machine ?: "
select reponse in "Oui" "Non"; do
    case $reponse in
        "Oui")
echo "Création du fichier de stockage de la clé SSH..."
mkdir sshkeyfile
echo "Création du dossier terminé."
echo "Génération de la clé SSH"
ssh-keygen -t ed25519 -f ~/sshkeyfile/sshkey
echo "Génération terminé chemin pour retrouver votre clé '~/sshfile/sshkey.txt' "
    break
    ;;
    "Non")
    echo "Très bien, passons à l'installation des packages"
    break
    ;;
    *)
     echo "Option invalide, veuillez choisir 'Oui' ou 'Non'."
    ;;
    esac
done


# Mise à jour des paquets
echo "Tout d'abord je vais faire une mise à jour de tes pacquets pour éviter tout conflit durant l'installation"
sudo apt update


# Installation des outils de développement
echo "Tout d'abord je vais installer des outils de développement sur ton ordinateur, (La liste des différents outils se trouve dans le fichier readme.md): "
select response in "Oui" "Non"; do
    case $reponse in
    "Oui")
dev_tools=("git" "wget" "curl" "vim" "zsh" "tmux" "composer" "docker.io" "docker-compose" "kubectl" "vagrant" "virtualbox")
for package in "${dev_tools[@]}"; do
    echo "Installation de $package..."
    sudo apt -y install "$package"
    echo "$package installé avec succès !"
done
echo "Tes outils de développement ont bien été installé 🚀"
break
;;
    "Non")
    echo "Tu risque d'en avoir fortement besoin pour travailler plutard..."
    break
    ;;
    *)
         echo "Option invalide, veuillez choisir 'Oui' ou 'Non'."
    ;;
    esac
done


# Installation des outils
echo "Je vais installer d'autres paquets mais j'ai besoin de savoir ce que tu souhaites faire avant: "
select reponse in "Serveurs / Services Web" "Outils de programmation" "Outils système"; do
    case $reponse in
        "Serveurs / Services Web")
            server_servweb_tools=("apache2" "nginx" "mysql-server" "postgresql" "sqlite3" "redis" "mongodb-org" "docker.io" "docker-compose" "certbot" "fail2ban")
            for package in "${server_servweb_tools[@]}"; do
                echo "Installation de $package..."
                sudo apt -y install "$package"
                echo "$package installé avec succès !"
            done
            echo "Tes outils de Serveurs / Services Web ont bien été installés 🚀"
            break
            ;;
        "Outils de programmation")
            programmers_tools=("python3-pip" "android-sdk" "flutter" "adb" "fastboot" "nodejs" "npm" "yarn" "php" "composer" "openjdk-17-jdk" "git" "vim" "zsh" "tmux")
            for package in "${programmers_tools[@]}"; do
                echo "Installation de $package..."
                sudo apt -y install "$package"
                echo "$package installé avec succès !"
            done
            echo "Tes outils de programmation ont bien été installés 🚀"
            break
            ;;
        "Outils système")
            system_tools=("htop" "neofetch" "net-tools" "gnome-tweaks" "curl" "wget" "nmap" "git" "tree" "ncdu")
            for package in "${system_tools[@]}"; do
                echo "Installation de $package..."
                sudo apt -y install "$package"
                echo "$package installé avec succès !"
            done
            echo "Tes outils système ont bien été installés 🚀"
            break
            ;;
        *)
            echo "Option invalide, veuillez choisir une option valide."
            ;;
    esac
done


# Configuration de votre git
echo "On va configurer ton git ensemble (Tu pourra également changer tes informations plutard): "
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


echo "Ton environnement de travail à bien été configuré."
