# UDLF Web Application

Complete web application for executing UDLF (Unsupervised Distance Learning Framework) algorithms, including Next.js frontend and Node.js/Express API.

## 🏗️ Architecture

This project unifies two separate repositories into a single Docker application:

- **Frontend**: Web interface in Next.js/React
- **Backend**: REST API in Node.js/Express with UDLF integration

## 📋 Prerequisites

- Docker
- Docker Compose
- Git (for submodules)

## 🚀 Quick Start - 3 Steps

### 1️⃣ Clone the repository and submodules
```bash
git clone https://github.com/itMatos/udlf-web-front-and-api.git
cd udlf-web-front-and-api
git submodule update --init --recursive
```

### 2️⃣ Configure the environment
```bash
# Option A: Automatic script (recommended)
./quick-setup.sh
```

Enter the path to your Datasets directory

### 3️⃣ Run
```bash
docker-compose up --build
```

**Ready!** Access: http://localhost:3000 and start testing!

## 📋 What you need to configure

**Only 1 variable:**
- `HOST_UDLF_PATH`: Path to your datasets directory

**Example:**
```bash
HOST_UDLF_PATH=/Users/username/datasets
```

## 📁 Project Structure

```
udlf-web-front-and-api/
├── front/                    # Frontend (Next.js)
├── udlf-web-api/            # Backend (Node.js/Express)
├── .env                     # Your configurations (create)
├── setup.env                # Configuration template
├── quick-setup.sh           # Automatic setup script
├── docker-compose.yml       # Unified Docker configuration
├── env.example              # Configuration example (legacy)
├── setup.sh                 # Original setup script
└── DOCKER_SETUP.md          # Detailed Docker documentation
```

## 🔧 Useful Commands

```bash
# Setup
./quick-setup.sh                   # Automatic configuration
cp setup.env .env                  # Manual configuration

# Execution
docker-compose up --build          # Build and start
docker-compose up -d               # Run in background
docker-compose down                # Stop services

# Logs
docker-compose logs -f             # View logs in real time
docker-compose logs api            # API logs only
docker-compose logs front          # Frontend logs only

# Maintenance
docker-compose exec api npm run build    # Build API
docker-compose exec front npm run lint   # Frontend lint
docker-compose down -v             # Clean volumes and containers
```

## 🛠️ Development

### Local Development (without Docker)

For local development, you need to install the submodules dependencies:

```bash
# Install dependencies automatically
./install-dependencies.sh

# Or manually for each submodule:
cd front && npm install && cd ..
cd udlf-web-api && npm install && cd ..

# Run locally:
# Terminal 1 - API
cd udlf-web-api && npm run dev

# Terminal 2 - Frontend  
cd front && npm run dev
```

### Development with Docker

For development with Docker (recommended):

```bash
docker-compose up --build
```

### Environment Variables

**Simplified Configuration:**
- `HOST_UDLF_PATH`: Path to your datasets directory (only required variable)

**Automatic Variables (don't need to be changed):**
- `API_PORT`: API port (default: 8080)
- `FRONTEND_PORT`: Frontend port (default: 3000)
- `NODE_ENV`: Environment (development/production)
- `API_INTERNAL_URL`: Internal API URL
- `FRONTEND_INTERNAL_URL`: Internal Frontend URL
- `NEXT_PUBLIC_URL_API_LOCAL`: Public API URL

### Hot Reload

Volumes are configured for development with hot reload:
- Code changes are automatically reflected
- `node_modules` are persisted for better performance

## 🐳 Docker

The application uses Docker Compose to orchestrate services:

- **Network**: `udlf-network` for internal communication
- **Volumes**: Data persistence and hot reload
- **Environment**: Unified configuration via `.env`

## 🆘 Troubleshooting

### Error: "Directory not found"
```bash
# Create the datasets directory
mkdir -p /your/path/datasets
```

### Error: "Port already in use"
```bash
# Check if ports 3000 and 8080 are free
lsof -i :3000
lsof -i :8080
```

### Error: "Docker not found"
```bash
# Install Docker Desktop
# https://www.docker.com/products/docker-desktop
```

### Problems with submodules
```bash
# Reinstall submodules
git submodule update --init --recursive
```



## 🎯 Application URLs

- **Web Interface**: http://localhost:3000
- **REST API**: http://localhost:8080
- **Health Check**: http://localhost:8080/