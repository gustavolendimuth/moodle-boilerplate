# Use a imagem oficial do MySQL como base
FROM mysql:8.0

# Cria um arquivo e escreve "bind-address=0.0.0.0" dentro dele
RUN echo "bind-address=0.0.0.0" > /etc/mysql/conf.d/custom-config.cnf

# Adiciona o arquivo .sql ao container
RUN curl -L https://raw.githubusercontent.com/gustavolendimuth/moodle-boilerplate/pazemente/mysql/i9791849_wfkz1.sql -o /docker-entrypoint-initdb.d/dump.sql