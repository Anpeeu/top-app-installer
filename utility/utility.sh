echo "Utility"
SOFTWARE=$@
elements=( "gnome-tweak" "AppImageLauncher" "nextcloud" "virtualbox") 

for elem in "${elements[@]}"
do
    echo $SOFTWARE | grep -w -q $elem
    if [ $? -eq 0 ]; then
        file=$(< ./files/$elem.sh)
        eval "$file"
    fi
done
