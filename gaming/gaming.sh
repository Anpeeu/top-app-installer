echo "Gaming"
SOFTWARE=$@
elements=( "steam" "minecraft" ) 

for elem in "${elements[@]}"
do
    echo $SOFTWARE | grep -w -q $elem
    if [ $? -eq 0 ]; then
        file=$(<./files/$elem.sh)
        eval "$file"
    fi
done
