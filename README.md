# Moodle boolerplate

## setup-docker.sh

### Baixar e executar o script

```
curl -L https://raw.githubusercontent.com/gustavolendimuth/moodle-boilerplate/main/setup-docker.sh -o setup-docker.sh &&
chmod +x setup-docker.sh &&
./setup-docker.sh
```

## Adicionar certificado ssl

```
sudo docker exec -it ubuntu-moodle-1 bash &&
sudo certbot --apache
```
