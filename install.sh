#/bin/bash
# SETTINGS 
current_dir=$PWD

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

#SYSTEM
cd system;bash system.sh $SOFTWARE;cd $current_dir;

#CODING
cd coding;bash coding.sh $SOFTWARE;cd $current_dir;

#UTILITY
cd utility;bash utility.sh $SOFTWARE;cd $current_dir;

#BROWSER
cd browser;bash browser.sh $SOFTWARE;cd $current_dir;

#SOCIAL-COMUNICATION
cd social-comunication;bash social-comunication.sh $SOFTWARE;cd $current_dir;

#MEDIA
cd media;bash media.sh $SOFTWARE;cd $current_dir;

#SECURITY
cd security;bash security.sh $SOFTWARE;cd $current_dir;


#GAMING
cd gaming;bash gaming.sh $SOFTWARE;cd $current_dir;


#OFFICE
cd office;bash office.sh $SOFTWARE;cd $current_dir;



if [ -n  "$SOFTWARE" ]; then
    printf "\n\n\n Pacchetti installati\n"
    for var in $SOFTWARE
    do
        echo " - $var"
    done
fi