#!/bin/bash
#Hamachi için terminal de bir arayüzü yapım aşaması
#Bu uyg çalışabilmesi için logmein-hamachi kurulu olması gerekmektedir.
#aybarsinan@gmail.com

#Renk Seçimi
cam='\e[0;36m'
yesil='\e[0;34m'
Yesillik='\033[92m'
acikyesil='\e[1;32m'
beyaz='\e[1;37m'
Kirmizi='\e[1;31m'
sari='\e[1;33m'
Mavi='\e[1;34m'

echo -e $Kirmizi"
╭╮╱╭┳━━━┳━╮╭━┳━━━┳━━━┳╮╱╭┳━━━━┳━━━┳━━━╮
┃┃╱┃┃╭━╮┃┃╰╯┃┃╭━╮┃╭━╮┃┃╱┃┃╭╮╭╮┃╭━━┫╭━╮┃
┃╰━╯┃┃╱┃┃╭╮╭╮┃┃╱┃┃┃╱╰┫╰━╯┣┫┃┃╰┫╰━━┫╰━╯┃
┃╭━╮┃╰━╯┃┃┃┃┃┃╰━╯┃┃╱╭┫╭━╮┣┫┃┃╱┃╭━━┫╭╮╭╯
┃┃╱┃┃╭━╮┃┃┃┃┃┃╭━╮┃╰━╯┃┃╱┃┃┃┃┃╱┃╰━━┫┃┃╰╮
╰╯╱╰┻╯╱╰┻╯╰╯╰┻╯╱╰┻━━━┻╯╱╰┻╯╰╯╱╰━━━┻╯╰━╯"

function sino()
{
        echo -e $Mavi"_____________________________________________________________________________"

}
sino
PS3="Secenegi Girin: "
Menu=("Başlat" "Giriş" "Hamachi" "Liste" "Server" "Katıl" "Ayrıl" "Sil" "Bilgi" "Ping" "Çık" "Çıkış")
select aybar in "${Menu[@]}"; do
	case $aybar in
	"Başlat")
        echo -e $cam"Hamachi $aybar "
		sudo /etc/init.d/logmein-hamachi start
		sino
		;;
		"Giriş")
		echo -e $cam"Hamachi $aybar "
		sudo hamachi login
		sino
		;;
    "Hamachi")
        echo -e $sari"Hamachi Menü $aybar "
		sudo hamachi
		sino
		;;
	"Liste")
        echo -e $cam"Hamachi Mevcut Kurulmuş $aybar "
		sudo hamachi list
		sino
        ;;
         "Server")
        echo -e $cam"Oyun ağı kurulumu $aybar "
		echo -n -e $beyaz"isim girin : "
		read isim
		echo -n -e $beyaz"şifre girin : "
		read sayi
		sudo hamachi create $isim $sayi
		sino
		;;
	"Katıl")
        echo -e $cam"Mevcut Gruba $aybar "
		echo -n -e $beyaz"isim girin : "
		read a
		echo -n -e $beyaz"şifre girin : "
		read s
		sudo hamachi join $a $s
		sino
		;;
		"Ayrıl")
		echo -e $cam"Bağlı olduğun ağdan $aybar"
		echo -n -e $beyaz"ID no : "
		read idno
		sudo hamachi leave $idno
		sino
		;;
	"Sil")
        echo -e $cam"Silinecek Kurulmus Grub $aybar "
		echo -n -e $beyaz"Silinecek : "
		read adi
		sudo hamachi delete $adi
		sino
       ;;
       "Bilgi")
       echo -e $cam"Ağ Hakkında $aybar "
       echo -n -e $beyaz"ID no : "
       read idno
       sudo hamachi network $idno
       netstat -tunp
       sino
       ;;
       "Ping")
       echo  -e $cam $aybar
       echo -n -e $beyaz"Sayısı : "
       read say
       echo -n -e $beyaz"ip no : "
       read ip
       echo "PID NO $$"
       trap "echo _işlem iptal edildi" 2
       ping -c $say $ip > /tmp/ping.log
       sino
       if  [ $? -eq 0 ]
        then
            echo -e $beyaz"Tamam"
           else
            echo -e $Kirmizi "Hata"
        fi
       tail -n 4  /tmp/ping.log
       sino
        ;;
        "Çık" )
        echo -e $cam"Hamachi oturumu kapatildi $aybar "
		sudo hamachi logoff
		sino
		;;
		"Çıkış")
		clear
		sino
	    echo -e $Kirmizi"________________________________Çıkış Yapıldı________________________________"
	    exit
	    ;;
		*) echo -e $Kirmizi"Hatalı Girdi $REBLY";;
	esac
done
