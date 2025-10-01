# ⚠️ SITE NÃO FUNCIONA - CONFIGURAR NETLIFY AGORA

## O QUE ESTÁ ERRADO

O site https://shopfastt.netlify.app/ está usando valores **placeholder** (fake) ao invés dos valores reais do Supabase. Por isso não funciona.

## SOLUÇÃO RÁPIDA (2 MINUTOS)

### 1. Abra Netlify
- Vá em: https://app.netlify.com/sites/shopfastt/configuration/env

### 2. Adicione estas variáveis:

Clique em **"Add a variable"** e adicione:

**VARIÁVEL 1:**
- Key: `VITE_SUPABASE_URL`
- Value: `https://rqxnabdasqfqpfgmnsem.supabase.co`

**VARIÁVEL 2:**
- Key: `VITE_SUPABASE_ANON_KEY`
- Value: `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJxeG5hYmRhc3FmcXBmZ21uc2VtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTkyODE0NzYsImV4cCI6MjA3NDg1NzQ3Nn0.e0BurRX5Cb1ic80NCsNJxtQz6sttMLuJ-Adnhdj6fB4`

### 3. Fazer Novo Deploy

Depois de salvar as variáveis:
- Vá em: https://app.netlify.com/sites/shopfastt/deploys
- Clique: **"Trigger deploy"** → **"Clear cache and deploy site"**
- Aguarde 1-2 minutos

### 4. Teste

Abra: https://shopfastt.netlify.app/ e pressione **Ctrl+Shift+R** (limpar cache)

Deve ver os produtos e conseguir navegar!

---

**SEM ESSAS VARIÁVEIS O SITE NÃO VAI FUNCIONAR!**
