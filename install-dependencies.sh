#!/bin/bash

# Script para instalar dependências em todos os submódulos
# UDLF Web Application - Dependency Installer

echo "🚀 Instalando dependências para UDLF Web Application..."
echo "=================================================="

# Verificar se estamos no diretório correto
if [ ! -f ".gitmodules" ]; then
    echo "❌ Erro: Execute este script na raiz do repositório (onde está o arquivo .gitmodules)"
    exit 1
fi

# Função para instalar dependências em um submódulo
install_submodule_deps() {
    local submodule_path=$1
    local submodule_name=$2
    
    echo ""
    echo "📦 Instalando dependências para $submodule_name..."
    echo "   Diretório: $submodule_path"
    
    if [ ! -d "$submodule_path" ]; then
        echo "   ⚠️  Submódulo $submodule_name não encontrado!"
        return 1
    fi
    
    cd "$submodule_path"
    
    if [ ! -f "package.json" ]; then
        echo "   ⚠️  package.json não encontrado em $submodule_path"
        cd ..
        return 1
    fi
    
    echo "   📥 Executando npm install..."
    if npm install; then
        echo "   ✅ Dependências instaladas com sucesso para $submodule_name"
    else
        echo "   ❌ Erro ao instalar dependências para $submodule_name"
        cd ..
        return 1
    fi
    
    cd ..
    return 0
}

# Instalar dependências para cada submódulo
echo "🔍 Encontrados os seguintes submódulos:"
cat .gitmodules | grep "path = " | sed 's/.*path = /   - /'

# Instalar dependências do frontend
install_submodule_deps "front" "Frontend (Next.js)"

# Instalar dependências da API
install_submodule_deps "udlf-web-api" "API (Node.js/Express)"

echo ""
echo "🎉 Instalação concluída!"
echo ""
echo "📋 Próximos passos:"
echo "   1. Para desenvolvimento local:"
echo "      - Frontend: cd front && npm run dev"
echo "      - API: cd udlf-web-api && npm run dev"
echo ""
echo "   2. Para desenvolvimento com Docker:"
echo "      - docker-compose up --build"
echo ""
echo "💡 Dica: Execute este script sempre que:"
echo "   - Clonar o repositório pela primeira vez"
echo "   - Fazer pull de mudanças que afetem dependências"
echo "   - Adicionar novos submódulos"
