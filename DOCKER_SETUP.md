# Setup Docker Unificado - UDLF Web Application

Este documento explica como configurar e executar a aplicação UDLF Web usando Docker unificado.

## Pré-requisitos

- Docker
- Docker Compose
- Git (para submódulos)

## Configuração Inicial

### 1. Clone o repositório e inicialize submódulos

```bash
git clone <seu-repositorio>
cd udlf-web-front-and-api
git submodule update --init --recursive
```

### 2. Configure as variáveis de ambiente

```bash
# Copie o arquivo de exemplo (configuração centralizada)
cp env.example .env

# Edite o arquivo .env conforme suas necessidades
nano .env
```

**Importante**: Este projeto usa um arquivo `.env` centralizado na raiz do repositório. Os submódulos não possuem seus próprios arquivos `.env` e compartilham as configurações do arquivo principal.

### 3. Principais variáveis de ambiente

- `HOST_UDLF_PATH`: Caminho para o executável UDLF
- `API_PORT`: Porta da API (padrão: 8080)
- `FRONTEND_PORT`: Porta do Frontend (padrão: 3000)
- `NODE_ENV`: Ambiente de execução (development/production)

## Execução

### Desenvolvimento

```bash
# Construir e iniciar todos os serviços
docker-compose up --build

# Executar em background
docker-compose up -d --build

# Ver logs
docker-compose logs -f

# Parar os serviços
docker-compose down
```

### Comandos úteis

```bash
# Reconstruir apenas um serviço
docker-compose up --build api
docker-compose up --build front

# Executar comandos dentro dos containers
docker-compose exec api npm run build
docker-compose exec front npm run lint

# Limpar volumes e imagens
docker-compose down -v
docker system prune -a
```

## Estrutura dos Serviços

### API (Backend)
- **Container**: `udlf_web_api`
- **Porta**: 8080
- **Diretório**: `./udlf-web-api`
- **Comandos disponíveis**:
  - `npm run dev` - Modo desenvolvimento
  - `npm run build` - Build para produção
  - `npm start` - Iniciar em produção

### Frontend
- **Container**: `udlf-web-frontend`
- **Porta**: 3000
- **Diretório**: `./front`
- **Comandos disponíveis**:
  - `npm run dev` - Modo desenvolvimento
  - `npm run build` - Build para produção
  - `npm start` - Iniciar em produção

## Volumes e Dados Persistentes

- `./udlf-web-api/uploads` - Uploads de arquivos
- `./udlf-web-api/outputs` - Resultados das execuções
- `./udlf-web-api/udlf` - Binário UDLF
- `node_modules` - Dependências (volumes anônimos)

## Rede

Os serviços se comunicam através da rede `udlf-network`:
- Frontend → API: `http://api:8080`
- API → Frontend: `http://front:3000`

## Troubleshooting

### Problemas comuns

1. **Porta já em uso**:
   ```bash
   # Verificar processos usando as portas
   lsof -i :3000
   lsof -i :8080
   
   # Alterar portas no docker-compose.yml se necessário
   ```

2. **Problemas com submódulos**:
   ```bash
   git submodule update --init --recursive
   ```

3. **Permissões do UDLF**:
   ```bash
   # Dentro do container da API
   docker-compose exec api chmod +x /app/udlf/bin/udlf
   ```

4. **Limpar cache do Docker**:
   ```bash
   docker-compose down
   docker system prune -a
   docker-compose up --build
   ```

### Logs

```bash
# Ver logs de todos os serviços
docker-compose logs

# Ver logs de um serviço específico
docker-compose logs api
docker-compose logs front

# Seguir logs em tempo real
docker-compose logs -f
```

## Desenvolvimento

Para desenvolvimento, os volumes estão configurados para hot-reload:
- Mudanças no código são refletidas automaticamente
- `node_modules` são persistidos em volumes anônimos para melhor performance
