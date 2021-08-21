#/bin/bash
# SETTINGS 
current_dir=$PWD

SYSTEM=$(whiptail --title "Installer" --checklist \
    "Seleziona i software che vuoi installare" 20 100 10 \
    "update" "aggiorno i repo e i pacchetti nel sistema" off\
    "broken-install" "risolvi problemi di dipendenze" off\
    3>&1 1>&2 2>&3 )

BROWSER=$(whiptail --title "Installer" --checklist \
    "Seleziona i software che vuoi installare" 20 100 10 \
    "brave" "browser brave" off\
    "chromium" "browser chromium" off\
    3>&1 1>&2 2>&3 )

CODING=$(whiptail --title "Installer" --checklist \
    "Seleziona i software che vuoi installare" 20 100 10 \
    "code" "visual studio code (snap)" off\
    "github-desktop" "porting di github-desktop (deb june 2021)" off\
    "docker" "docker engine (no gui)" off\
    "pgadmin4" "postgress db, desktop e web modalità" off\
    "gitkraken" "client git gui (deb)" off\
    "java+netbeans" " default jdk + netbeans (snap)" off\
    3>&1 1>&2 2>&3 )

GAMING=$(whiptail --title "Installer" --checklist \
    "Seleziona i software che vuoi installare" 20 100 10 \
    "steam" "steam, no altra descrizione" off\
    "minecraft" "minecraft desktop ufficiale (deb)" off\
    3>&1 1>&2 2>&3 )

MEDIA=$(whiptail --title "Installer" --checklist \
    "Seleziona i software che vuoi installare" 20 100 10 \
    "spotify" "streaming musicale (snap)" off\
    "obs-studio" "registrazione video e dirette (snap)" off\
    "vlc" "riproduttore audio-video (snap)" off\
    "handbrake" "converditore di video" off\
    3>&1 1>&2 2>&3 )

OFFICE=$(whiptail --title "Installer" --checklist \
    "Seleziona i software che vuoi installare" 20 100 10 \
    "libreoffice" "editing documenti opensource" off\
    3>&1 1>&2 2>&3 )

SECURITY=$(whiptail --title "Installer" --checklist \
    "Seleziona i software che vuoi installare" 20 100 10 \
    "nordvpn" "vpn nordvpn" off\
    "bitwarden" "gestore password bitwarden (snap)" off\
    3>&1 1>&2 2>&3 )

SOCIAL=$(whiptail --title "Installer" --checklist \
    "Seleziona i software che vuoi installare" 20 100 10 \
    "telegram" "telegram desktop (snap)" off\
    "whatsdesk" "client desktop whatsapp (snap)" off\
    "discord" "software per comunicazione e interazione vocale/testuale (snap)" off\
    "zoom" "software per organizzare dirette (snap)" off\
    "skype" "videochiamate (snap)" off\
    3>&1 1>&2 2>&3 )


UTILITY=$(whiptail --title "Installer" --checklist \
    "Seleziona i software che vuoi installare" 20 100 10 \
    "gnome-tweak" "utile per modificare gnome" off\
    "AppImageLauncher" "se spostati in ~/Appimage i file .appimage verranno mostrati come app" off\
    "nextcloud" "client di sincronizzazzione per nextcloud (appimage)" off\
    "virtualbox" "gestore macchine virtuale (deb)" off\
    3>&1 1>&2 2>&3 )

#SYSTEM
cd system;bash system.sh $SYSTEM;cd $current_dir;

#CODING
cd coding;bash coding.sh $CODING;cd $current_dir;

#UTILITY
cd utility;bash utility.sh $UTILITY;cd $current_dir;

#BROWSER
cd browser;bash browser.sh $BROWSER;cd $current_dir;

#SOCIAL-COMUNICATION
cd social-comunication;bash social-comunication.sh $SOCIAL;cd $current_dir;

#MEDIA
cd media;bash media.sh $MEDIA;cd $current_dir;

#SECURITY
cd security;bash security.sh $SECURITY;cd $current_dir;

#GAMING
cd gaming;bash gaming.sh $GAMING;cd $current_dir;

#OFFICE
cd office;bash office.sh $OFFICE;cd $current_dir;



if [ -n  "$SOFTWARE" ]; then
    printf "\n\n\n Pacchetti installati\n"
    for var in $SOFTWARE
    do
        echo " - $var"
    done
fi

