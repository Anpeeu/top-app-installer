echo $1
echo "CIAO MONDO"
for var in "$@"
do
SOFTWARE="$var" $SOFTWARE
done
echo $SOFTWARE | grep -w -q "update"
if [ $? -eq 0 ]; then
    echo "SI"
    apt update && apt upgrade -y
fi