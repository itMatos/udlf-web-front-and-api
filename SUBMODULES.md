# Guia de Submódulos - UDLF Web Application

Este documento explica como trabalhar com submódulos neste projeto e como resolver problemas comuns.

## 📋 O que são Submódulos?

Submódulos permitem incluir um repositório Git dentro de outro repositório Git como um subdiretório. Este projeto usa submódulos para organizar o frontend e a API em repositórios separados.

### Submódulos deste projeto:
- `front/` - Frontend Next.js
- `udlf-web-api/` - API Node.js/Express

## 🚨 Problema Comum: "Módulo não encontrado"

### Por que acontece?

Quando você clona um repositório com submódulos:

1. **No Docker**: ✅ Funciona porque o Docker instala as dependências durante o build
2. **Localmente**: ❌ Falha porque os `node_modules` não são commitados (estão no `.gitignore`)

### Evidência do problema:
```bash
npm list --depth=0
# Resultado: UNMET DEPENDENCY para todas as dependências
```

## ✅ Soluções

### Solução 1: Script Automático (Recomendado)

```bash
# Execute na raiz do projeto
./install-dependencies.sh
```

Este script:
- Detecta automaticamente todos os submódulos
- Instala dependências em cada um
- Fornece feedback detalhado do progresso

### Solução 2: Manual

```bash
# Para cada submódulo:
cd front && npm install && cd ..
cd udlf-web-api && npm install && cd ..
```

### Solução 3: Comando Git

```bash
# Clonar com submódulos já inicializados
git clone --recurse-submodules <seu-repositorio>

# Ou após clonar:
git submodule update --init --recursive
```

## 🔧 Comandos Úteis para Submódulos

### Gerenciamento de Submódulos

```bash
# Ver status dos submódulos
git submodule status

# Atualizar submódulos para a versão mais recente
git submodule update --remote

# Adicionar um novo submódulo
git submodule add <url-do-repositorio> <caminho>

# Remover um submódulo
git submodule deinit <caminho>
git rm <caminho>
```

### Desenvolvimento

```bash
# Trabalhar dentro de um submódulo
cd front
git checkout main
git pull origin main
npm install  # Se necessário

# Fazer mudanças e commitar
git add .
git commit -m "Sua mudança"
git push origin main

# Voltar para o repositório principal
cd ..
git add front
git commit -m "Atualizar submódulo front"
git push origin main
```

## 🐳 Docker vs Desenvolvimento Local

### Docker (Recomendado para desenvolvimento)
- ✅ Dependências instaladas automaticamente
- ✅ Ambiente isolado e consistente
- ✅ Hot reload configurado
- ✅ Não precisa instalar dependências manualmente

```bash
docker-compose up --build
```

### Desenvolvimento Local
- ⚠️ Precisa instalar dependências manualmente
- ⚠️ Pode ter problemas de versão do Node.js
- ✅ Mais rápido para mudanças pequenas
- ✅ Debugging mais direto

```bash
# Instalar dependências primeiro
./install-dependencies.sh

# Executar em terminais separados
cd udlf-web-api && npm run dev  # Terminal 1
cd front && npm run dev         # Terminal 2
```

## 🚀 Fluxo de Trabalho Recomendado

### Primeira configuração:
```bash
git clone <repositorio>
cd udlf-web-front-and-api
git submodule update --init --recursive
./install-dependencies.sh  # Para desenvolvimento local
```

### Desenvolvimento diário:
```bash
# Opção 1: Docker (recomendado)
docker-compose up --build

# Opção 2: Local
cd udlf-web-api && npm run dev  # Terminal 1
cd front && npm run dev         # Terminal 2
```

### Atualizações:
```bash
# Atualizar submódulos
git submodule update --remote

# Reinstalar dependências se necessário
./install-dependencies.sh
```

## 🔍 Troubleshooting

### Problema: "Cannot find module"
**Solução**: Execute `./install-dependencies.sh`

### Problema: "Submodule not found"
**Solução**: 
```bash
git submodule update --init --recursive
```

### Problema: "Permission denied" no script
**Solução**:
```bash
chmod +x install-dependencies.sh
```

### Problema: Dependências desatualizadas
**Solução**:
```bash
# Limpar node_modules e reinstalar
cd front && rm -rf node_modules package-lock.json && npm install && cd ..
cd udlf-web-api && rm -rf node_modules package-lock.json && npm install && cd ..
```

## 📝 Notas Importantes

1. **Nunca commite `node_modules/`** - eles estão no `.gitignore` por boas razões
2. **Sempre execute o script de dependências** após clonar ou fazer pull
3. **Use Docker para desenvolvimento** quando possível - é mais confiável
4. **Mantenha os submódulos atualizados** com `git submodule update --remote`

## 🤝 Contribuindo

Se você adicionar novos submódulos:

1. Adicione ao `.gitmodules`
2. Atualize o script `install-dependencies.sh`
3. Atualize este documento
4. Teste em ambiente limpo

## 📚 Recursos Adicionais

- [Documentação oficial do Git sobre submódulos](https://git-scm.com/book/en/v2/Git-Tools-Submodules)
- [DOCKER_SETUP.md](DOCKER_SETUP.md) - Setup detalhado do Docker
- [README.md](README.md) - Documentação principal do projeto
