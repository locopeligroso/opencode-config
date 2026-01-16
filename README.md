# OpenCode Configuration

Configurazione personale di OpenCode con plugin Antigravity e Oh-My-OpenCode.

## Fix Gemini API

Questo repository contiene un fix per il bug di tool calling con i modelli Google Gemini.

### Problema
L'API Gemini rifiutava le richieste con errore:
```
Bad Request: Invalid JSON payload received. Unknown name "parameters" at 'request.tools[0]': Cannot find field.
```

### Soluzione
Il plugin `opencode-antigravity-auth` inviava un campo `parameters` non supportato dall'API Gemini.
Il fix rimuove i campi non supportati lasciando solo `function.input_schema`.

### Patch Automatica
Dopo ogni `bun install`, il fix viene riapplicato automaticamente tramite lo script `apply-patches.sh`.

### File Modificati
- `patches/opencode-antigravity-auth+1.2.9-beta.8.patch` - Patch file con il fix
- `apply-patches.sh` - Script che applica il patch
- `package.json` - Configurato per eseguire `apply-patches.sh` dopo install

### Test
Per verificare che il fix funzioni:
```bash
bun run postinstall
```

### Modelli Gemini Configurati
- `explore`: Gemini 3 Flash
- `frontend-ui-ux-engineer`: Gemini 3 Pro High  
- `document-writer`: Gemini 3 Flash
- `multimodal-looker`: Gemini 3 Flash
