#!/bin/bash
#Hamachi için terminal de bir arayüzü yapım aşaması
#Bu uyg çalışabilmesi için logmein-hamachi kurulu olması gerekmektedir.
#aybarsinan@gmail.com
function sino()
{
        echo "_____________________________________________________________________________"

}
sino
PS3="Secenegi Girin: "
Menu=("Başlat" "Giriş" "Hamachi" "Liste" "Server" "Katıl" "Ayrıl" "Sil" "Bilgi" "Ping" "Çık" "Çıkış")
select aybar in "${Menu[@]}"; do
	case $aybar in
	"Başlat")
        echo "Hamachi $aybar "
		sudo /etc/init.d/logmein-hamachi start
		sino
		;;
		"Giriş")
		echo "Hamachi $aybar "
		sudo hamachi login
		sino
		;;
    "Hamachi")
        echo "Hamachi Menü $aybar "
		sudo hamachi
		sino
		;;
	"Liste")
        echo "Hamachi Mevcut Kurulmuş $aybar "
		sudo hamachi list
		sino
        ;;
         "Server")
        echo "Oyun ağı kurulumu $aybar "
		echo -n "isim girin : "
		read isim
		echo -n "şifre girin : "
		read sayi
		sudo hamachi create $isim $sayi
		sino
		;;
	"Katıl")
        echo "Mevcut Gruba $aybar "
		echo -n "isim girin : "
		read a
		echo -n "şifre girin : "
		read s
		sudo hamachi join $a $s
		sino
		;;
		"Ayrıl")
		echo "Bağlı olduğun ağdan $aybar"
		echo -n "ID no : "
		read idno
		sudo hamachi leave $idno
		sino
		;;
	"Sil")
        echo "Silinecek Kurulmus Grub $aybar "
		echo -n "Silinecek : "
		read adi
		sudo hamachi delete $adi
		sino
       ;;
       "Bilgi")
       echo "Ağ Hakkında $aybar "
       echo -n "ID no : "
       read idno
       sudo hamachi network $idno
       netstat -tunp
       sino
       ;;
       "Ping")
       echo  $aybar
       echo -n "Sayısı : "
       read say
       echo -n "ip no : "
       read ip
       echo "PID NO $$"
       ping -c $say $ip > /tmp/ping.log
       sino
       if  [ $? -eq 0 ]
        then
            echo Tamam
           else
            echo Hata
        fi
       tail -n 4  /tmp/ping.log
       sino
        ;;
        "Çık" )
        echo "Hamachi oturumu kapatildi $aybar "
		sudo hamachi logoff
		sino
		;;
		"Çıkış")
		clear
		sino
	    echo "________________________________Çıkış Yapıldı________________________________"
	    exit
	    ;;
		*) echo "Hatalı Girdi $REBLY";;
	esac
done
