# Aplicação Flask com Nginx e Docker, desenvolvida utilizando o Ubuntu 22.04 LTS com WSL

## Descrição
Este projeto consiste em uma aplicação Flask integrada ao Nginx, utilizando Dockerfile e Docker Compose para facilitar sua implantação e gerenciamento da infraestrutura. O Nginx funciona como um proxy reverso, distribuindo as requisições entre múltiplas instâncias da aplicação Flask para otimizar o desempenho e garantir balanceamento de carga. Todo o desenvolvimento foi realizado no Ubuntu 22.04 dentro do WSL, com o Visual Studio Code como ambiente de codificação.

## Tecnologias Utilizadas
- **Flask** → Framework para aplicação web em Python.
- **Docker** → Gerenciamento de containers.
- **Docker Compose** → Orquestração de múltiplos serviços Docker.
- **Nginx** → Proxy reverso e balanceador de carga.
- **Ubuntu** 22.04 LTS (WSL) → Ambiente de execução.

## Estrutura do Projeto

```
.
├── app.py # Aplicação Flask
├── requirements.txt # Dependências do Flask
├── docker/
│ └── docker-compose.yml # Automatiza criação das instâncias
├── nginx/
│ └── nginx.conf # Alteração nginx.conf para atender upstream
├── Dockerfile # Criação de uma imagem padrão para a aplicação.
├── README.md # Instruções (Esse arquivo)

```

## Como buildar e rodar o projeto

1. **Clone o repositório:**

   ```bash
   git clone https://github.com/jbgoncalvess/WSL-Docker-Flask-Nginx.git
   cd WSL-Docker-Flask-Nginx
   ```

2. **Construa e inicie os containers:**

    Use o comando abaixo para construir as imagens do Docker e iniciar os containers:

    ```bash
    docker-compose up --build
    ```

3. **Acessar a aplicação:**

   Após iniciar os containers, a aplicação estará disponível em:

   ```bash
   http://localhost:7777

   ```

O Nginx redirecionará o tráfego para um dos containers Flask e retornará o nome do container e o IP que processou a requisição.

O arquivo `docker-compose.yml` define quatro serviços:

- **web1**: Um container Flask executando a aplicação na porta interna 7777, mapeada para a porta 5001 no host.
- **web2**: Um segundo container Flask rodando na porta interna 5000 e mapeado para a porta 5002 no host.
- **web3**: Um terceiro container Flask rodando igualmente na porta interna 7777, mapeada para a porta 5003 no host.
- **nginx**: Contêiner rodando o Nginx, exposto na porta 7777 do host e configurado para fazer o balanceamento de carga entre os três serviços Flask (*web1, web2 e web3*) via a porta interna 80.

Todos os serviços estão conectados por meio de uma rede Docker chamada flask_network, utilizando o driver bridge.

## Encerrando os serviços

Para parar e remover os containers e a rede criada pelo Docker Compose, execute:

```bash
docker-compose down
```