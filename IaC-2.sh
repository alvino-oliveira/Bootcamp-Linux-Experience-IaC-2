#!/bin/bash
#Autor: github algino-oliveira
#Version:0.1
#
#Script para automatizar processo para criar e configurar um site em apache no ubuntu

echo "Iniciando o script"
#
echo "Atualizando o servidor ... "
apt-get update
apt-get upgrade -y
echo "Servidor atualizado com sucesso."
echo "Instalando os serviços do apache, unzip, etc ... "
apt-get install apache2 -y
apt-get install unzip -y
echo "Serviços instalados com sucesso."
echo "Configurando o apache para subir no boot ... "
systemctl enable apache2 
echo "Apache configurado com sucesso."
echo "Baixando e descompactando os arquivos para o site no diretorio /tmp ... "
cd /tmp
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
unzip main.zip
echo "Arquivos baixados e descompactados com sucesso"
echo "copiando os arquivos para o diretorio padrao do Apache ... "
cd linux-site-dio-main
cp -r * /var/www/html/
echo "Arquivos copiados com sucesso."
echo "Removendo as arquivos do /tmp ... "
cd /tmp
rm -rf linux-site-dio-main
rm -rf main.zip
echo "Arqvuibos removidos. Diretório /tmp limpo."
echo "Fim do script"


