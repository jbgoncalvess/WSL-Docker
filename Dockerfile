# Define a imagem base Debian mais recente
FROM debian:latest

# Define o mantenedor da imagem
LABEL maintainer="DevOps Unesc Pos"

# Atualiza os pacotes do sistema para evitar problemas durante a instalação
RUN apt-get update && apt-get upgrade -y

# Instala o NGINX para atuar como servidor web dentro do contêiner
RUN apt-get install nginx -y

# Expõe a porta 80 para acesso ao servidor (mapear as portas depois - p 8010:80)
EXPOSE 80

# Mantém o NGINX rodando no foreground para que o contêiner não seja encerrado
CMD [ "nginx", "-g", "daemon off;" ]