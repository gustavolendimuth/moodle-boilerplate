# Use a imagem oficial do MySQL como base
FROM mysql:8.0

RUN apt-get install -y nano

# Adiciona o arquivo .sql ao container
RUN curl -L https://raw.githubusercontent.com/gustavolendimuth/moodle-boilerplate/pazemente/mysql/i9791849_wfkz1.sql -o /docker-entrypoint-initdb.d/dump.sql