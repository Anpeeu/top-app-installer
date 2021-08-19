#/bin/bash


SOFTWARE=$(whiptail --title "Installer" --checklist \
    "Seleziona i software che vuoi installare" 20 100 10 \
    "update" "aggiorno i repo e i pacchetti nel sistema" off\
    "broken-install" "risolvi problemi di dipendenze" off\
    "code" "visual studio code (snap)" off\
    "nordvpn" "vpn nordvpn" off\
    "gnome-tweak" "utile per modificare gnome" off\
    "brave" "browser brave" off\
    "chromium" "browser chromium" off\
    "bitwarden" "gestore password bitwarden (snap)" off\
    "telegram" "telegram desktop (snap)" off\
    "discord" "software per comunicazione e interazione vocale/testuale (snap)" off\
    "zoom" "software per organizzare dirette (snap)" off\
    "spotify" "streaming musicale (snap)" off\
    "obs-studio" "registrazione video e dirette (snap)" off\
    "vlc" "riproduttore audio-video (snap)" off\
    "github-desktop" "porting di github-desktop (deb june 2021)" off\
    "docker" "docker engine (no gui)" off\
    "steam" "steam, no altra descrizione" off\
    "libreoffice" "editing documenti opensource" off\
    "AppImageLauncher" "se spostati in ~/Appimage i file .appimage verranno mostrati come app" off\
    "nextcloud" "client di sincronizzazzione per nextcloud (appimage)" off\
    "minecraft" "minecraft desktop ufficiale (deb)" off\
    "pgadmin4" "postgress db, desktop e web modalità" off\
    "gitkraken" "client git gui (deb)" off\
    "skype" "videochiamate" off\
    "java+netbeans" " default jdk + netbeans (snap)" off\
    "handbrake" "converditore di video" off\
    "virtualbox" "gestore macchine virtuale (deb)" off\
    3>&1 1>&2 2>&3 )

bash coding.sh $SOFTWARE

echo $SOFTWARE | grep -w -q "update"
if [ $? -eq 0 ]; then
    echo "NO"
    apt update && apt upgrade -y
fi

echo $SOFTWARE | grep -w -q "broken-install"
if [ $? -eq 0 ]; then
    apt --fix-broken install -y
fi

#CODING
echo $SOFTWARE | grep -w -q "code"
if [ $? -eq 0 ]; then
    snap install code --classic
fi

echo $SOFTWARE | grep -w -q "github-desktop"
if [ $? -eq 0 ]; then
    wget https://github.com/shiftkey/desktop/releases/download/release-2.9.0-linux4/GitHubDesktop-linux-2.9.0-linux4.deb
    apt install ./GitHubDesktop-linux-2.9.0-linux4.deb -y
fi

echo $SOFTWARE | grep -w -q "gitkraken"
if [ $? -eq 0 ]; then
    wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
    dpkg -i gitkraken-amd64.deb
    rm gitkraken-amd64.deb
fi

echo $SOFTWARE | grep -w -q "java+netbeans"
if [ $? -eq 0 ]; then 
    apt install -y default-jdk
    snap install netbeans --classic
fi



echo $SOFTWARE | grep -w -q "docker"
if [ $? -eq 0 ]; then
    apt-get update
    apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg \
        lsb-release
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo \
    "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
    apt-get update
    apt-get install -y docker-ce docker-ce-cli containerd.io
fi

echo $SOFTWARE | grep -w -q "pgadmin4"
if [ $? -eq 0 ]; then
    curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | apt-key add
    sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'
    apt install pgadmin4 -y
fi

#UTILITY
echo $SOFTWARE | grep -w -q "gnome-tweak"
if [ $? -eq 0 ]; then
    apt install gnome-tweak-tool -y
fi

echo $SOFTWARE | grep -w -q "AppImageLauncher"
if [ $? -eq 0 ]; then
    #mkdir ~/Applications
    #cd ~/Applications
    wget https://github.com/TheAssassin/AppImageLauncher/releases/download/v2.2.0/appimagelauncher_2.2.0-travis995.0f91801.bionic_amd64.deb
    apt install -y ./appimagelauncher_2.2.0-travis995.0f91801.bionic_amd64.deb
    rm ./appimagelauncher_2.2.0-travis995.0f91801.bionic_amd64.deb
fi

echo $SOFTWARE | grep -w -q "nextcloud"
if [ $? -eq 0 ]; then
    wget https://github.com/nextcloud/desktop/releases/download/v3.3.1/Nextcloud-3.3.1-x86_64.AppImage
    mv Nextcloud-3.3.1-x86_64.AppImage ~/Applications
fi

echo $SOFTWARE | grep -w -q "virtualbox"
if [ $? -eq 0 ]; then
    wget https://download.virtualbox.org/virtualbox/6.1.26/virtualbox-6.1_6.1.26-145957~Ubuntu~eoan_amd64.deb
    apt install ./virtualbox-6.1_6.1.26-145957~Ubuntu~eoan_amd64.deb -y
    rm virtualbox-6.1_6.1.26-145957~Ubuntu~eoan_amd64.deb
fi


#BROWSER
echo $SOFTWARE | grep -w -q "brave"
if [ $? -eq 0 ]; then
    apt install apt-transport-https curl -y
    curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"| tee /etc/apt/sources.list.d/brave-browser-release.list
    apt update
    apt install brave-browser -y
fi

echo $SOFTWARE | grep -w -q "chromium"
if [ $? -eq 0 ]; then
    apt install chromium-browser -y
fi

#SOCIAL-COMUNICATION
echo $SOFTWARE | grep -w -q "telegram"
if [ $? -eq 0 ]; then
    snap install telegram-desktop
fi

echo $SOFTWARE | grep -w -q "discord"
if [ $? -eq 0 ]; then
    snap install discord
fi

echo $SOFTWARE | grep -w -q "zoom"
if [ $? -eq 0 ]; then
    snap install zoom-client
fi

echo $SOFTWARE | grep -w -q "skype"
if [ $? -eq 0 ]; then
    snap install skype --classic
fi


#MEDIA
echo $SOFTWARE | grep -w -q "spotify"
if [ $? -eq 0 ]; then
    snap install spotify
fi

echo $SOFTWARE | grep -w -q "obs-studio"
if [ $? -eq 0 ]; then
    snap install obs-studio
fi

echo $SOFTWARE | grep -w -q "vlc"
if [ $? -eq 0 ]; then
    snap install vlc
fi

echo $SOFTWARE | grep -w -q "handbrake"
if [ $? -eq 0 ]; then
    apt-get install -y handbrake
fi



 

#SECURITY
echo $SOFTWARE | grep -w -q "nordvpn"
if [ $? -eq 0 ]; then
    apt install wget -y
    wget https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn-release_1.0.0_all.deb
    apt install ./nordvpn-release_1.0.0_all.deb -y
    apt update
    apt install nordvpn -y
    rm ./nordvpn-release_1.0.0_all.deb
fi

echo $SOFTWARE | grep -w -q "bitwarden"
if [ $? -eq 0 ]; then
    snap install bitwarden
fi

#GAMING
echo $SOFTWARE | grep -w -q "steam"
if [ $? -eq 0 ]; then
    apt install steam -y
fi

echo $SOFTWARE | grep -w -q "minecraft"
if [ $? -eq 0 ]; then
    wget https://launcher.mojang.com/download/Minecraft.deb
    apt install Minecraft.deb -y
    rm Minecraft.deb
fi

#OFFICE
echo $SOFTWARE | grep -w -q "libreoffice"
if [ $? -eq 0 ]; then
    yes '' | add-apt-repository ppa:libreoffice/ppa
    apt update
    apt install libreoffice libreoffice-l10n-it -y
fi

if [ -n  "$SOFTWARE" ]; then
    printf "\n\n\n Pacchetti installati\n"
    for var in $SOFTWARE
    do
        echo " - $var"
    done
fi