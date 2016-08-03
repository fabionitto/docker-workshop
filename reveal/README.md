# Workshop Docker

## Apresentação

Para utilizar a apresentação, existem duas opções: Vagrant e Docker.

### Docker

Basta realizar um docker run dentro da pasta reveal:

$ docker run -d -v $(pwd)/slides:/slides/ -p 8000:8000 "danidemi/docker-reveal.js:latest"

### Vagrant

Basta rodar, dentro da pasta reveal:

$ vagrant up

### Acesso

O acesso à apresentação estará disponível em http://localhost:8000 após rodar um dos comandos acima.
