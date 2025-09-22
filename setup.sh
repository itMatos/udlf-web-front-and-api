#!/bin/bash

# Script de setup para UDLF Web Application
# Este script configura o ambiente Docker unificado

set -e

echo "🚀 Configurando UDLF Web Application..."

# Verificar se Docker está instalado
if ! command -v docker &> /dev/null; then
    echo "❌ Docker não está instalado. Por favor, instale o Docker primeiro."
    exit 1
fi

if ! command -v docker-compose &> /dev/null; then
    echo "❌ Docker Compose não está instalado. Por favor, instale o Docker Compose primeiro."
    exit 1
fi

# Inicializar submódulos se necessário
echo "📦 Inicializando submódulos..."
if [ -d ".git" ]; then
    git submodule update --init --recursive
else
    echo "⚠️  Não é um repositório git. Pulando inicialização de submódulos."
fi

# Criar arquivo .env se não existir
if [ ! -f ".env" ]; then
    echo "⚙️  Criando arquivo .env centralizado..."
    if [ -f "env.example" ]; then
        cp env.example .env
        echo "✅ Arquivo .env centralizado criado a partir do env.example"
        echo "📝 Por favor, edite o arquivo .env conforme suas necessidades:"
        echo "   nano .env"
    else
        echo "❌ Arquivo env.example não encontrado!"
        exit 1
    fi
else
    echo "✅ Arquivo .env centralizado já existe"
fi

# Remover arquivos .env dos submódulos se existirem
echo "🧹 Limpando arquivos .env dos submódulos..."
if [ -f "front/.env" ]; then
    rm front/.env
    echo "✅ Removido front/.env"
fi
if [ -f "udlf-web-api/.env" ]; then
    rm udlf-web-api/.env
    echo "✅ Removido udlf-web-api/.env"
fi
echo "ℹ️  Usando apenas o arquivo .env centralizado do repositório principal"

# Criar diretórios necessários
echo "📁 Criando diretórios necessários..."
mkdir -p udlf-web-api/uploads
mkdir -p udlf-web-api/outputs

# Verificar se o binário UDLF existe
if [ -d "udlf-web-api/udlf" ]; then
    echo "✅ Diretório UDLF encontrado"
    if [ -f "udlf-web-api/udlf/bin/udlf" ]; then
        echo "✅ Binário UDLF encontrado"
        chmod +x udlf-web-api/udlf/bin/udlf
        echo "✅ Permissões do binário UDLF configuradas"
    else
        echo "⚠️  Binário UDLF não encontrado em udlf-web-api/udlf/bin/udlf"
    fi
else
    echo "⚠️  Diretório UDLF não encontrado em udlf-web-api/udlf"
fi

# Construir as imagens Docker
echo "🔨 Construindo imagens Docker..."
docker-compose build

echo ""
echo "🎉 Setup concluído com sucesso!"
echo ""
echo "📋 Próximos passos:"
echo "1. Edite o arquivo .env se necessário:"
echo "   nano .env"
echo ""
echo "2. Inicie os serviços:"
echo "   docker-compose up -d"
echo ""
echo "3. Verifique os logs:"
echo "   docker-compose logs -f"
echo ""
echo "4. Acesse a aplicação:"
echo "   Frontend: http://localhost:3000"
echo "   API: http://localhost:8080"
echo ""
echo "📚 Para mais informações, consulte DOCKER_SETUP.md"
