# 🔍 Debug: Por que os produtos não aparecem?

## Passo 1: Corrigir RLS Policies (FAÇA ISSO PRIMEIRO!)

O SQL de correção já está no clipboard!

**Cole no Supabase SQL Editor:**

1. Vá em https://supabase.com/dashboard → Seu projeto
2. **SQL Editor** → **New Query**
3. **Cole** (Cmd/Ctrl + V)
4. Clique em **Run**

Isso vai garantir que os produtos possam ser lidos publicamente.

---

## Passo 2: Verificar no Browser Console

Abra o site: https://shopfastt.netlify.app

**Abra o Console do Browser:**
- Chrome/Edge: `F12` ou `Cmd+Option+J` (Mac) / `Ctrl+Shift+J` (Windows)
- Firefox: `F12` ou `Cmd+Option+K` (Mac) / `Ctrl+Shift+K` (Windows)
- Safari: `Cmd+Option+C` (precisa habilitar Developer Menu primeiro)

**O que procurar:**

1. **Erros vermelhos?**
   - Se sim, copie e me envie

2. **Digite no console:**
   ```javascript
   // Verificar se o Supabase está conectado
   console.log('Supabase URL:', import.meta.env.VITE_SUPABASE_URL);

   // Testar query diretamente
   const { createClient } = await import('@supabase/supabase-js');
   const supabase = createClient(
     import.meta.env.VITE_SUPABASE_URL,
     import.meta.env.VITE_SUPABASE_ANON_KEY
   );

   const { data, error } = await supabase.from('products').select('*').limit(5);
   console.log('Products:', data);
   console.log('Error:', error);
   ```

3. **Resultado esperado:**
   - `Products:` deve mostrar array com produtos
   - `Error:` deve ser `null`

4. **Se error não for null:**
   - Copie o erro completo e me envie

---

## Passo 3: Verificar Variáveis de Ambiente no Netlify

1. Vá em: https://app.netlify.com
2. Selecione o site **shopfastt**
3. **Site Settings** → **Environment Variables**

**Verifique se existem:**
- `VITE_SUPABASE_URL` → Deve ser `https://xxxxxxxx.supabase.co`
- `VITE_SUPABASE_ANON_KEY` → Chave longa começando com `eyJ...`

**Se NÃO existirem, adicione:**
1. Clique em **Add a variable**
2. Adicione as duas variáveis do seu arquivo `.env`
3. **Importante:** Clique em **Trigger deploy** para redeployar

---

## Passo 4: Verificar Deployment

Veja os logs do último deploy:

1. https://app.netlify.com → Seu site
2. **Deploys** → Último deploy
3. Verifique se não tem erros

Se teve erro de "secrets detected", já corrigimos isso no commit anterior.

---

## Passo 5: Forçar Novo Deploy

Se nada funcionou até aqui, force um novo deploy:

```bash
# No terminal, faça qualquer mudança pequena
echo "# Deploy trigger" >> README.md

# Commit e push
git add README.md
git commit -m "chore: trigger deploy"
git push
```

Aguarde 2-3 minutos para o Netlify redeployar.

---

## Verificação Rápida no Supabase

Antes de tudo, confirme que os dados estão lá:

1. Supabase Dashboard → **Table Editor**
2. Abra a tabela **products**
3. Deve ter 61 linhas com produtos

Se não tiver, rode o seed.sql novamente.

---

## Possíveis Causas (por ordem de probabilidade):

### 1. RLS Policies não configuradas ⚠️ **MAIS PROVÁVEL**
**Solução:** Execute o `fix-rls-policies.sql` (já no clipboard!)

### 2. Variáveis de ambiente não configuradas no Netlify
**Solução:** Adicione no Netlify → Site Settings → Environment Variables

### 3. Cache do Browser
**Solução:**
- Hard refresh: `Cmd+Shift+R` (Mac) ou `Ctrl+F5` (Windows)
- Ou abra em aba anônima

### 4. Build antigo no Netlify
**Solução:** Force um novo deploy (Passo 5)

### 5. Problemas de CORS
**Solução:** Verifique no Supabase → Settings → API → "Allow all origins" deve estar habilitado (ou adicione `https://shopfastt.netlify.app`)

---

## Quick Test (Cole no Console do Browser)

```javascript
// Test rápido
fetch('https://YOUR_PROJECT.supabase.co/rest/v1/products?select=*&limit=1', {
  headers: {
    'apikey': 'YOUR_ANON_KEY',
    'Authorization': 'Bearer YOUR_ANON_KEY'
  }
})
.then(r => r.json())
.then(data => console.log('Direct API test:', data))
.catch(err => console.error('API Error:', err));
```

Substitua `YOUR_PROJECT` e `YOUR_ANON_KEY` pelos seus valores.

Se retornar produtos → Problema está no frontend/build
Se retornar erro → Problema está no Supabase (RLS)

---

## Me Envie:

1. ✅ Resultado do Passo 1 (RLS fix)
2. 🔍 Resultado do console test (Passo 2)
3. ⚙️ Screenshot das env vars do Netlify (Passo 3)
4. 📋 Último log de deploy do Netlify

Com essas informações, posso identificar exatamente o problema! 🎯
