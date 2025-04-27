#!/bin/bash

echo "Atualizando o servidor..."
sudo apt update -y
sudo apt upgrade -y

echo "Instalando o Apache2..."
sudo apt install apache2 -y

echo "Instalando o Unzip..."
sudo apt install unzip -y

echo "Baixando a aplicação do GitHub..."
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip -P /tmp

echo "Descompactando o arquivo..."
unzip /tmp/main.zip -d /tmp

echo "Copiando os arquivos para o diretório do Apache..."
sudo cp -r /tmp/linux-site-dio-main/* /var/www/html/

echo "Ajustando permissões para os arquivos copiados..."
sudo chown -R www-data:www-data /var/www/html/

echo "Reiniciando o Apache..."
sudo systemctl restart apache2

echo "Verificando o status do Apache..."
sudo systemctl status apache2 | grep "active (running)"

echo "Servidor web configurado e aplicação copiada com sucesso! Acesse o IP do servidor para visualizar a aplicação. :D"
