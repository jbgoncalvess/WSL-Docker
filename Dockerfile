# Utilizar uma imagem de python slim, para otimizar o desempenho.
FROM python:3.10-slim

# Definir o diretório de trabalho dentro do contêiner
WORKDIR /app

# Atualizar o Python e o pip
RUN apt update && apt install -y python3 python3-pip
RUN pip install --upgrade pip

# Copiar os arquivos locais para o diretório de trabalho do contêiner
COPY requirements.txt requirements.txt
COPY app.py app.py

# Instalar as dependências
RUN pip install -r requirements.txt

# Expor a porta que a aplicação vai utilizar
EXPOSE 7777

# Comando para executar a aplicação
CMD ["python", "app.py"]