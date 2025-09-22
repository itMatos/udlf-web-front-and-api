# UDLF Web Application

Aplicação web completa para execução de algoritmos UDLF (Unified Data Learning Framework), incluindo frontend em Next.js e API em Node.js/Express.

## 🏗️ Arquitetura

Este projeto unifica dois repositórios separados em uma única aplicação Docker:

- **Frontend**: Interface web em Next.js/React
- **Backend**: API REST em Node.js/Express com integração ao UDLF

## 🚀 Início Rápido

### Setup Automático

```bash
# Execute o script de setup
./setup.sh
```

### Setup Manual

1. **Configure o ambiente**:
   ```bash
   # Clone e inicialize submódulos
   git clone <seu-repositorio>
   cd udlf-web-front-and-api
   git submodule update --init --recursive
   
   # Configure variáveis de ambiente
   cp env.example .env
   # Edite .env conforme necessário
   ```

2. **Instale dependências dos submódulos**:
   ```bash
   # Para desenvolvimento local (obrigatório)
   ./install-dependencies.sh
   
   # Ou manualmente:
   cd front && npm install && cd ..
   cd udlf-web-api && npm install && cd ..
   ```

3. **Execute a aplicação**:
   ```bash
   docker-compose up --build
   ```

4. **Acesse**:
   - Frontend: http://localhost:3000
   - API: http://localhost:8080

## 📁 Estrutura do Projeto

```
udlf-web-front-and-api/
├── front/                    # Frontend (Next.js)
├── udlf-web-api/            # Backend (Node.js/Express)
├── docker-compose.yml       # Configuração Docker unificada
├── .env                     # Variáveis de ambiente (criar a partir do env.example)
├── env.example              # Exemplo de configuração
├── setup.sh                 # Script de setup automático
└── DOCKER_SETUP.md          # Documentação detalhada do Docker
```

## 🔧 Comandos Úteis

```bash
# Desenvolvimento
docker-compose up --build           # Construir e iniciar
docker-compose up -d                # Executar em background
docker-compose down                 # Parar serviços

# Logs
docker-compose logs -f              # Ver logs em tempo real
docker-compose logs api             # Logs apenas da API
docker-compose logs front           # Logs apenas do frontend

# Manutenção
docker-compose exec api npm run build    # Build da API
docker-compose exec front npm run lint   # Lint do frontend
```

## 📚 Documentação

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

Principais configurações no arquivo `.env`:

- `HOST_UDLF_PATH`: Caminho para o executável UDLF
- `API_PORT`: Porta da API (padrão: 8080)
- `FRONTEND_PORT`: Porta do Frontend (padrão: 3000)
- `NODE_ENV`: Ambiente (development/production)

### Hot Reload

Os volumes estão configurados para desenvolvimento com hot reload:
- Mudanças no código são refletidas automaticamente
- `node_modules` são persistidos para melhor performance

## 🐳 Docker

A aplicação usa Docker Compose para orquestrar os serviços:

- **Rede**: `udlf-network` para comunicação interna
- **Volumes**: Persistência de dados e hot reload
- **Ambiente**: Configuração unificada via `.env`

## 📋 Pré-requisitos

- Docker
- Docker Compose
- Git (para submódulos)

## 🤝 Contribuição

1. Faça fork do projeto
2. Crie uma branch para sua feature
3. Commit suas mudanças
4. Push para a branch
5. Abra um Pull Request

## 📄 Licença

Este projeto está sob licença [especificar licença].
