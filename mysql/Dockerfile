# # Use a imagem oficial do MySQL como base
# FROM mysql:8.0

# # Cria um arquivo e escreve "bind-address=0.0.0.0" dentro dele
# RUN echo "bind-address=0.0.0.0" > /etc/mysql/conf.d/custom-config.cnf

# # Adiciona o arquivo .sql ao container
# RUN curl -L https://raw.githubusercontent.com/gustavolendimuth/moodle-boilerplate/pazemente/mysql/i9791849_wfkz1.sql -o /docker-entrypoint-initdb.d/dump.sql

# EXPOSE 3306

# Baseia a imagem no Ubuntu
FROM ubuntu:20.04

# Evita prompts interativos durante a construção da imagem
ARG DEBIAN_FRONTEND=noninteractive

# Atualiza a lista de pacotes e instala o software necessário
RUN apt-get update && apt-get install -y \
    mysql-server \
    nano \
    && rm -rf /var/lib/apt/lists/*

# Configura o MySQL para aceitar conexões de qualquer host
# Isto é útil para desenvolvimento e testes, mas considere a segurança para produção!
RUN sed -i 's/^bind-address\s*=.*/bind-address = 0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf

# Opcional: Copia um script de entrypoint personalizado
# COPY entrypoint.sh /usr/local/bin/entrypoint.sh
# RUN chmod +x /usr/local/bin/entrypoint.sh

# Expõe a porta padrão do MySQL
EXPOSE 3306

# Opcional: Configura o entrypoint e o comando padrão
# ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["mysqld_safe"]
