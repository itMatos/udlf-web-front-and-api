# 📋 Instruções de Uso - UDLF Web Application

## ⚡ Setup em 3 Passos

### 1️⃣ Clone o repositório
```bash
git clone <seu-repositorio>
cd udlf-web-front-and-api
git submodule update --init --recursive
```

### 2️⃣ Configure o ambiente
```bash
# Execute o script automático
./quick-setup.sh

# OU configure manualmente:
cp setup.env .env
# Edite o arquivo .env e configure apenas HOST_UDLF_PATH
```

### 3️⃣ Execute a aplicação
```bash
docker-compose up --build
```

**Acesse:** http://localhost:3000

## 🔧 Configuração Manual

Se preferir configurar manualmente:

1. **Copie o template:**
   ```bash
   cp setup.env .env
   ```

2. **Edite o arquivo .env:**
   ```bash
   nano .env
   ```

3. **Configure apenas esta variável:**
   ```bash
   HOST_UDLF_PATH=/seu/caminho/para/datasets
   ```

4. **Execute:**
   ```bash
   docker-compose up --build
   ```

## 📁 Exemplo de Configuração

**Arquivo .env:**
```bash
# UDLF Web Application - Environment Configuration

# REQUIRED: Datasets directory path
HOST_UDLF_PATH=/Users/username/datasets

# All other variables are pre-configured
API_PORT=8080
API_HOST=localhost
FRONTEND_PORT=3000
FRONTEND_HOST=localhost
NODE_ENV=development
API_INTERNAL_URL=http://api:8080
FRONTEND_INTERNAL_URL=http://front:3000
NEXT_PUBLIC_URL_API_LOCAL=http://localhost:8080
APP_DATASETS_PATH=/app/datasets
EXECUTABLE_PATH=/app/udlf/bin/udlf
```

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

# Pare os serviços que estão usando essas portas
```

### Erro: "Docker not found"
```bash
# Instale Docker Desktop
# https://www.docker.com/products/docker-desktop
```

## 🎯 URLs da Aplicação

- **Interface Web**: http://localhost:3000
- **API REST**: http://localhost:8080
- **Health Check**: http://localhost:8080/

## 📞 Comandos Úteis

```bash
# Parar a aplicação
docker-compose down

# Ver logs em tempo real
docker-compose logs -f

# Reconstruir containers
docker-compose up --build

# Limpar tudo (volumes e containers)
docker-compose down -v

# Executar em background
docker-compose up -d --build
```

---

**Precisa de ajuda?** Consulte a documentação completa em `DOCKER_SETUP.md`
