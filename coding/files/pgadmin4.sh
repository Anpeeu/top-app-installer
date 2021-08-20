curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add
sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/sudo apt/$(lsb_release -cs) pgadmin4 main" > /etc/sudo apt/sources.list.d/pgadmin4.list && sudo apt update'
sudo apt install pgadmin4 -y