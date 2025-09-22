# UDLF Web Application

Aplicação web completa para execução de algoritmos UDLF (Unsupervised Distance Learning Framework), incluindo frontend em Next.js e API em Node.js/Express.

## 🏗️ Arquitetura

Este projeto unifica dois repositórios separados em uma única aplicação Docker:

- **Frontend**: Interface web em Next.js/React
- **Backend**: API REST em Node.js/Express com integração ao UDLF

## 📋 Pré-requisitos

- Docker
- Docker Compose
- Git (para submódulos)

## 🚀 Início Rápido - 3 Passos

### 1️⃣ Clone o repositório e os submódulos
```bash
git clone https://github.com/itMatos/udlf-web-front-and-api.git
cd udlf-web-front-and-api
git submodule update --init --recursive
```

### 2️⃣ Configure o ambiente
```bash
# Opção A: Script automático (recomendado)
./quick-setup.sh
```

Insira o caminho para seu diretório de Datasets

### 3️⃣ Execute
```bash
docker-compose up --build
```

**Pronto!** Acesse: http://localhost:3000 e comece a testar!

## 📋 O que você precisa configurar

**Apenas 1 variável:**
- `HOST_UDLF_PATH`: Caminho para seu diretório de datasets

**Exemplo:**
```bash
HOST_UDLF_PATH=/Users/username/datasets
```

## 📁 Estrutura do Projeto

```
udlf-web-front-and-api/
├── front/                    # Frontend (Next.js)
├── udlf-web-api/            # Backend (Node.js/Express)
├── .env                     # Suas configurações (criar)
├── setup.env                # Template de configuração
├── quick-setup.sh           # Script de setup automático
├── docker-compose.yml       # Configuração Docker unificada
├── env.example              # Exemplo de configuração (legacy)
├── setup.sh                 # Script de setup original
└── DOCKER_SETUP.md          # Documentação detalhada do Docker
```

## 🔧 Comandos Úteis

```bash
# Setup
./quick-setup.sh                   # Configuração automática
cp setup.env .env                  # Configuração manual

# Execução
docker-compose up --build          # Construir e iniciar
docker-compose up -d               # Executar em background
docker-compose down                # Parar serviços

# Logs
docker-compose logs -f             # Ver logs em tempo real
docker-compose logs api            # Logs apenas da API
docker-compose logs front          # Logs apenas do frontend

# Manutenção
docker-compose exec api npm run build    # Build da API
docker-compose exec front npm run lint   # Lint do frontend
docker-compose down -v             # Limpar volumes e containers
```

## 📚 Documentação

- [Início Rápido](QUICK_START.md) - Guia de 3 passos
- [Instruções](INSTRUÇÕES.md) - Instruções detalhadas em português
- [Setup Docker Detalhado](DOCKER_SETUP.md) - Guia completo de configuração
- [Guia de Submódulos](SUBMODULES.md) - Como trabalhar com submódulos e resolver problemas comuns
- [Frontend README](front/README.md) - Documentação do frontend
- [API README](udlf-web-api/README) - Documentação da API

## 🛠️ Desenvolvimento

### Desenvolvimento Local (sem Docker)

Para desenvolvimento local, você precisa instalar as dependências dos submódulos:

```bash
# Instalar dependências automaticamente
./install-dependencies.sh

# Ou manualmente para cada submódulo:
cd front && npm install && cd ..
cd udlf-web-api && npm install && cd ..

# Executar localmente:
# Terminal 1 - API
cd udlf-web-api && npm run dev

# Terminal 2 - Frontend  
cd front && npm run dev
```

### Desenvolvimento com Docker

Para desenvolvimento com Docker (recomendado):

```bash
docker-compose up --build
```

### Variáveis de Ambiente

**Configuração Simplificada:**
- `HOST_UDLF_PATH`: Caminho para seu diretório de datasets (única variável obrigatória)

**Variáveis Automáticas (não precisam ser alteradas):**
- `API_PORT`: Porta da API (padrão: 8080)
- `FRONTEND_PORT`: Porta do Frontend (padrão: 3000)
- `NODE_ENV`: Ambiente (development/production)
- `API_INTERNAL_URL`: URL interna da API
- `FRONTEND_INTERNAL_URL`: URL interna do Frontend
- `NEXT_PUBLIC_URL_API_LOCAL`: URL pública da API

### Hot Reload

Os volumes estão configurados para desenvolvimento com hot reload:
- Mudanças no código são refletidas automaticamente
- `node_modules` são persistidos para melhor performance

## 🐳 Docker

A aplicação usa Docker Compose para orquestrar os serviços:

- **Rede**: `udlf-network` para comunicação interna
- **Volumes**: Persistência de dados e hot reload
- **Ambiente**: Configuração unificada via `.env`

## 🆘 Solução de Problemas

### Erro: "Directory not found"
```bash
# Crie o diretório de datasets
mkdir -p /seu/caminho/datasets
```

### Erro: "Port already in use"
```bash
# Verifique se as portas 3000 e 8080 estão livres
lsof -i :3000
lsof -i :8080
```

### Erro: "Docker not found"
```bash
# Instale Docker Desktop
# https://www.docker.com/products/docker-desktop
```

### Problemas com submódulos
```bash
# Reinstale os submódulos
git submodule update --init --recursive
```



## 🤝 Contribuição

1. Faça fork do projeto
2. Crie uma branch para sua feature
3. Commit suas mudanças
4. Push para a branch
5. Abra um Pull Request

## 🎯 URLs da Aplicação

- **Interface Web**: http://localhost:3000
- **API REST**: http://localhost:8080
- **Health Check**: http://localhost:8080/

## 📄 Licença

Este projeto está sob licença [especificar licença].
