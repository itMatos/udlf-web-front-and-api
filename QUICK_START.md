# 🚀 UDLF Web Application - Quick Start

Execute a aplicação em **3 passos simples**:

## ⚡ Setup Rápido

### 1. Clone e prepare
```bash
git clone <seu-repositorio>
cd udlf-web-front-and-api
git submodule update --init --recursive
```

### 2. Configure o ambiente
```bash
# Opção A: Script automático (recomendado)
./quick-setup.sh

# Opção B: Manual
cp setup.env .env
# Edite apenas HOST_UDLF_PATH no arquivo .env
```

### 3. Execute
```bash
docker-compose up --build
```

**Pronto!** Acesse: http://localhost:3000

## 📋 O que você precisa configurar

**Apenas 1 variável:**
- `HOST_UDLF_PATH`: Caminho para seu diretório de datasets

**Exemplo:**
```bash
HOST_UDLF_PATH=/Users/username/datasets
```

## 🔧 Comandos Úteis

```bash
# Parar a aplicação
docker-compose down

# Ver logs
docker-compose logs -f

# Reconstruir
docker-compose up --build

# Limpar tudo
docker-compose down -v
```

## 🆘 Problemas?

### "Directory not found"
```bash
# Crie o diretório
mkdir -p /seu/caminho/datasets
```

### "Port already in use"
```bash
# Pare outros serviços nas portas 3000 e 8080
# Ou mude as portas no arquivo .env
```

### "Docker not found"
```bash
# Instale Docker Desktop
# https://www.docker.com/products/docker-desktop
```

## 📁 Estrutura

```
udlf-web-front-and-api/
├── front/              # Frontend (Next.js)
├── udlf-web-api/       # Backend (Node.js)
├── .env               # Suas configurações (criar)
├── setup.env          # Template de configuração
├── quick-setup.sh     # Script de setup automático
└── docker-compose.yml # Configuração Docker
```

## 🎯 URLs

- **Frontend**: http://localhost:3000
- **API**: http://localhost:8080
- **Health Check**: http://localhost:8080/

---

**Precisa de ajuda?** Consulte a documentação completa em `DOCKER_SETUP.md`
