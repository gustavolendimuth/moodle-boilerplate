# Moodle boolerplate

## setup-docker.sh

### Baixar e executar o script

```
# Removing existing files and folders
rm -rf *

# Baixando e executando script de instalação
curl -L https://raw.githubusercontent.com/gustavolendimuth/moodle-boilerplate/main/setup-docker.sh -o setup-docker.sh &&
chmod +x setup-docker.sh &&
./setup-docker.sh
```

## Adicionar certificado ssl

```
docker exec -it ubuntu-moodle-1 bash

sudo apt-get update &&
sudo apt-get install certbot python3-certbot-apache &&
sudo certbot --apache

# Configurar o Virtual Host para usar SSL
echo '<VirtualHost *:443> \n\
  ServerAdmin webmaster@localhost \n\
  DocumentRoot /var/www/html \n\
  SSLEngine on \n\
  SSLCertificateFile /etc/ssl/certs/your_domain.crt \n\
  SSLCertificateKeyFile /etc/ssl/private/your_domain.key \n\
  SSLCertificateChainFile /etc/ssl/certs/CA.pem \n\
  <Directory /var/www/html/> \n\
      AllowOverride All \n\
  </Directory> \n\
  ErrorLog ${APACHE_LOG_DIR}/error.log \n\
  CustomLog ${APACHE_LOG_DIR}/access.log combined \n\
</VirtualHost>' > /etc/apache2/sites-available/default-ssl.conf

# Habilitar o módulo SSL do Apache e o site padrão SSL
a2enmod ssl && \
a2ensite default-ssl
```
