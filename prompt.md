# Replica configurazione OpenCode (laptop)

Obiettivo: replica esatta della configurazione attuale.

## 1) Requisiti
- OpenCode installato
- Plugin: `opencode-antigravity-auth@beta`, `oh-my-opencode`

## 2) Config principale
Modifica `~/.config/opencode/opencode.json` con:

```json
{
  "$schema": "https://opencode.ai/config.json",
  "plugin": [
    "opencode-antigravity-auth@beta",
    "oh-my-opencode"
  ],
  "provider": {
    "openai": {
      "name": "OpenAI",
      "models": {
        "gpt-5.2-codex": { "name": "GPT-5.2 Codex" }
      }
    },
    "google": {
      "name": "Google",
      "models": {
        "antigravity-gemini-3-pro-high": { "name": "Gemini 3 Pro High (Antigravity)", "thinking": true, "attachment": true, "limit": { "context": 1048576, "output": 65535 }, "modalities": { "input": ["text","image","pdf"], "output": ["text"] } },
        "antigravity-gemini-3-pro-low": { "name": "Gemini 3 Pro Low (Antigravity)", "thinking": true, "attachment": true, "limit": { "context": 1048576, "output": 65535 }, "modalities": { "input": ["text","image","pdf"], "output": ["text"] } },
        "antigravity-gemini-3-flash": { "name": "Gemini 3 Flash (Antigravity)", "attachment": true, "limit": { "context": 1048576, "output": 65536 }, "modalities": { "input": ["text","image","pdf"], "output": ["text"] } },
        "antigravity-claude-sonnet-4-5": { "name": "Claude Sonnet 4.5 (Antigravity)", "attachment": true, "limit": { "context": 200000, "output": 8192 }, "modalities": { "input": ["text","image","pdf"], "output": ["text"] } },
        "antigravity-claude-sonnet-4-5-thinking-medium": { "name": "Claude Sonnet 4.5 Thinking Medium (Antigravity)", "thinking": true, "attachment": true, "limit": { "context": 200000, "output": 8192 }, "modalities": { "input": ["text","image","pdf"], "output": ["text"] } },
        "antigravity-claude-opus-4-5-thinking-high": { "name": "Claude Opus 4.5 Thinking High (Antigravity)", "thinking": true, "attachment": true, "limit": { "context": 200000, "output": 8192 }, "modalities": { "input": ["text","image","pdf"], "output": ["text"] } }
      }
    }
  }
}
```

## 3) Config agenti (Oh-My-OpenCode)
Modifica `~/.config/opencode/oh-my-opencode.json` con:

```json
{
  "$schema": "https://raw.githubusercontent.com/code-yeongyu/oh-my-opencode/master/assets/oh-my-opencode.schema.json",
  "google_auth": false,
  "categories": {
    "business-logic": {
      "model": "openai/gpt-5.2-codex",
      "temperature": 0.1,
      "prompt_append": "Focus on backend logic, architecture, and code correctness."
    }
  },
  "agents": {
    "Sisyphus": {
      "model": "google/antigravity-claude-sonnet-4-5-thinking-medium",
      "temperature": 0.3,
      "description": "Main orchestrator - uses Sonnet 4.5 Thinking Medium"
    },
    "Prometheus (Planner)": {
      "model": "google/antigravity-gemini-3-pro-high",
      "temperature": 0.4,
      "description": "Planner - uses Gemini 3 Pro High"
    },
    "librarian": {
      "model": "openai/gpt-5.2-codex",
      "temperature": 0.2,
      "description": "Task execution - uses Codex for coding tasks"
    },
    "explore": {
      "model": "google/antigravity-gemini-3-flash",
      "temperature": 0.5,
      "description": "Fast exploration - uses Gemini Flash for speed"
    },
    "oracle": {
      "model": "google/antigravity-claude-opus-4-5-thinking-high",
      "temperature": 0.1,
      "description": "Strategic debugging - uses Opus 4.5 Thinking High"
    },
    "frontend-ui-ux-engineer": {
      "model": "google/antigravity-gemini-3-pro-high",
      "temperature": 0.7,
      "description": "UI/UX specialist - uses Gemini Pro for creative design"
    },
    "document-writer": {
      "model": "google/antigravity-gemini-3-flash",
      "temperature": 0.6,
      "description": "Documentation - uses Gemini Flash for writing"
    },
    "multimodal-looker": {
      "model": "google/antigravity-gemini-3-flash",
      "temperature": 0.4,
      "description": "Visual analysis - uses Gemini Flash for images/PDFs"
    },
    "Sisyphus-Junior": {
      "model": "openai/gpt-5.2-codex",
      "temperature": 0.2,
      "description": "Fallback codex agent for code-heavy tasks"
    }
  }
}
```

## 4) Logout Google (solo Google)
Lascia Google disconnesso:

`~/.config/opencode/antigravity-accounts.json`

```json
{
  "version": 3,
  "accounts": [],
  "activeIndex": 0,
  "activeIndexByFamily": { "claude": 0, "gemini": 0 }
}
```

## 5) OpenAI login (necessario)
Esegui su laptop:

```
opencode auth login
```

Seleziona **OpenAI** e completa OAuth.

Nota: non fare login Google.

## 6) Verifica rapida
- Avvia OpenCode
- Controlla: `Sisyphus` usa `antigravity-claude-sonnet-4-5-thinking-medium`
- `librarian` e `Sisyphus-Junior` su `gpt-5.2-codex`
- `Prometheus (Planner)` su `gemini-3-pro-high`
