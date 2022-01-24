#!/bin/bash
#Script By Dendi Kusnandi

if [ "${EUID}" -ne 0 ]; then
echo "You need to run this script as root"
exit 1
fi
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com);
echo "Checking VPS"
IZIN=$( curl https://raw.githubusercontent.com/dendikusnandiii/deristacrot/main/member | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "${green}Permintaan Diterima...${NC}";
else
echo -e "${red}Permintaan Ditolak!${NC}";
echo "Hanya Untuk Pengguna Terdaftar"
echo "Silahkan Hubungi Admin"
echo "WhatsApp : 082117696800"
fi
mkdir /etc/v2ray
mkdir /var/lib/script;
clear
echo "Masukkan Domain Anda, Jika Anda Tidak Memiliki Domain Klik Enter"
echo "Ketikkan Perintah addhost setelah proses instalasi Script Selesai"
read -p "Hostname / Domain: " host
echo "IP=$host" >> /var/lib/script/ipvps.conf
echo "$host" >> /etc/v2ray/domain

#Menginstall Script
wget https://raw.githubusercontent.com/dendikusnandiii/deristassh/main/ssh-vpn.sh && chmod +x ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh
wget https://raw.githubusercontent.com/dendikusnandiii/deristaws/main/websocket-python/websocket.sh && chmod +x websocket.sh && screen -S websocket.sh ./websocket.sh
wget https://raw.githubusercontent.com/dendikusnandiii/deristasstp/main/sstp.sh && chmod +x sstp.sh && screen -S sstp ./sstp.sh
wget https://raw.githubusercontent.com/dendikusnandiii/deristawg/main/wg.sh && chmod +x wg.sh && screen -S wg ./wg.sh
wget https://raw.githubusercontent.com/dendikusnandiii/deristassr/main/ssr.sh && chmod +x ssr.sh && screen -S ssr ./ssr.sh
wget https://raw.githubusercontent.com/dendikusnandiii/deristass/main/shadowsocksobfs.sh && chmod +x shadowsocksobfs.sh && screen -S ss ./shadowsocksobfs.sh
wget https://raw.githubusercontent.com/dendikusnandiii/deristains/main/ins-vt.sh && chmod +x ins-vt.sh && sed -i -e 's/\r$//' ins-vt.sh && screen -S v2ray ./ins-vt.sh
wget https://raw.githubusercontent.com/dendikusnandiii/deristaipsec/main/ipsec.sh && chmod +x ipsec.sh && screen -S ipsec ./ipsec.sh
rm -f /root/ssh-vpn.sh
rm -f /root/websocket.sh
rm -f /root/sstp.sh
rm -f /root/wg.sh
rm -f /root/ssr.sh
rm -f /root/shadowsocksobfs.sh
rm -f /root/ins-vt.sh
rm -f /root/go.sh
rm -f /root/ipsec.sh
history -c
echo "1.1" > /home/ver
clear
echo " "
echo "Installation has been completed!!"
echo " "
echo "==================-Autoscript Premium-============" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "----------------------------------------------------------------------------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                  : 22, 500"  | tee -a log-install.txt
echo "   - SSH-WS CDN OpenSSH       : 2095"  | tee -a log-install.txt
echo "   - SSH-WS CDN Dropbear      : 8880"  | tee -a log-install.txt
echo "   - SSH-WS CDN SSL/TLS       : 443"  | tee -a log-install.txt
echo "   - OpenVPN-WS               : 2082"  | tee -a log-install.txt
echo "   - OpenVPN                  : TCP 1194, UDP 2200, SSL 992, X1197"  | tee -a log-install.txt
echo "   - Stunnel4 SSL/TLS         : 444, 777"  | tee -a log-install.txt
echo "   - Dropbear                 : 143, 109"  | tee -a log-install.txt
echo "   - Squid Proxy              : 3128, 8080 (limit to IP Server)"  | tee -a log-install.txt
echo "   - Badvpn                   : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                    : 81"  | tee -a log-install.txt
echo "   - Wireguard                : 7070"  | tee -a log-install.txt
echo "   - L2TP/IPSEC VPN           : 1701"  | tee -a log-install.txt
echo "   - PPTP VPN                 : 1732"  | tee -a log-install.txt
echo "   - SSTP VPN                 : 5555"  | tee -a log-install.txt
echo "   - Shadowsocks-R            : 1443-1543"  | tee -a log-install.txt
echo "   - SS-OBFS TLS              : 2443-2543"  | tee -a log-install.txt
echo "   - SS-OBFS HTTP             : 3443-3453"  | tee -a log-install.txt
echo "   - V2RAY Vmess TLS          : 4443"  | tee -a log-install.txt
echo "   - V2RAY Vmess None TLS     : 780"  | tee -a log-install.txt
echo "   - Trojan                   : 6443"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 04.00 GMT +7" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   - Dev/Main                : Dendi Kusnandi"  | tee -a log-install.txt
echo "   - Whatsapp                : 082117696800"  | tee -a log-install.txt
echo "------------------Script Created By Dendi Kusnandi-----------------" | tee -a log-install.txt
echo ""
echo " Reboot 10 Sec"
sleep 10
reboot
