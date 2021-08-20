sudo apt install wget -y
wget https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn-release_1.0.0_all.deb
sudo apt install ./nordvpn-release_1.0.0_all.deb -y
sudo apt update
sudo apt install nordvpn -y
rm ./nordvpn-release_1.0.0_all.deb