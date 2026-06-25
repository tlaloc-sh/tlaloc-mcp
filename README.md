# Tlaloc MCP Server

**Connect Claude, ChatGPT, and any AI assistant to official Mexican data.**

The Tlaloc MCP (Model Context Protocol) server gives AI assistants and agents live,
authenticated access to official Mexican data sources: **CURP** (RENAPO), **RFC** (SAT),
**postal codes** (SEPOMEX), **phone numbers** (IFT), and **SPEI payment receipts / CEP**
(Banxico). Pay per call in MXN via SPEI — no credit card, no subscription.

> As far as we know, this is the **first MCP server for official Mexican data**.

## Why

- **AI-native.** Validate a CURP, verify an RFC, or download a SPEI CEP straight from your
  assistant or agent — no glue code.
- **Official sources.** RENAPO, SAT, SEPOMEX, IFT, Banxico.
- **One key, many services.** A single `tlmx_` API key covers everything.
- **Fair, transparent pricing.** Pay per call (CURP $0.25, RFC $0.10, postal/phone $0.01,
  CEP $0.10 MXN). Prepaid via SPEI, no minimum, no monthly fee.

## Quick start

1. Create an account and generate an API key at **https://console.tlaloc.sh** (keys look
   like `tlmx_...`).
2. Add the server to your MCP client:

### Claude Code

```bash
claude mcp add --transport http tlaloc \
  https://api.tlaloc.sh/mx/mcp \
  --header "Authorization: Bearer tlmx_YOUR_API_KEY"
```

### Claude Desktop / other MCP clients (JSON config)

```json
{
  "mcpServers": {
    "tlaloc": {
      "transport": "http",
      "url": "https://api.tlaloc.sh/mx/mcp",
      "headers": { "Authorization": "Bearer tlmx_YOUR_API_KEY" }
    }
  }
}
```

- **Endpoint:** `https://api.tlaloc.sh/mx/mcp`
- **Transport:** StreamableHTTP (HTTP)
- **Auth:** `Authorization: Bearer tlmx_YOUR_API_KEY` (OAuth is also supported)

More ready-to-run snippets (curl, Python, JavaScript, Claude Desktop config) live in
[`examples/`](./examples).

## Tools

| Tool | What it does | Source | Price (MXN) |
|------|--------------|--------|-------------|
| `consultar_curp` | Validate a CURP and return its data | RENAPO | 0.25 |
| `validar_rfc` | Verify an RFC: exists, active, can issue invoices | SAT | 0.10 |
| `consultar_codigo_postal` | Postal code → neighborhoods, city, state | SEPOMEX | 0.01 |
| `consultar_telefono` | Phone number → carrier and portability | IFT | 0.01 |
| `descargar_cep` | Download a SPEI payment receipt (CEP) | Banxico | 0.10 |
| `consultar_cep` | Verify a SPEI CEP | Banxico | 0.10 |
| `listar_instituciones_cep` | List the CEP institutions catalog | Banxico | — |

## Example prompts

- *"Validate this CURP and tell me if it's valid and who it belongs to."*
- *"Is RFC GODE561231GR8 active and able to issue invoices (CFDI)?"*
- *"What neighborhoods are in postal code 06700?"*
- *"Which carrier owns the number 55 1234 5678, and has it been ported?"*
- *"Download and verify the SPEI CEP for this transfer."*

## Pricing

Prepaid units, **1 unit = $1 MXN (VAT included)**. Top up via SPEI — no card, no minimum,
no subscription. Full pricing: https://www.tlaloc.sh/en/pricing.html

## Links

- **Website:** https://www.tlaloc.sh
- **API docs (OpenAPI/Swagger):** https://api.tlaloc.sh/mx/docs
- **Console (get your API key):** https://console.tlaloc.sh
- **Guide (EN):** https://www.tlaloc.sh/en/blog/mexico-api-mcp.html
- **Contact:** hello@tlaloc.sh

---

## Español

Servidor **MCP** de Tlaloc: conecta **Claude, ChatGPT y cualquier asistente de IA** con
datos oficiales de México — **CURP** (RENAPO), **RFC** (SAT), **códigos postales**
(SEPOMEX), **teléfonos** (IFT) y **comprobantes SPEI/CEP** (Banxico). Pago por consulta vía
**SPEI, sin tarjeta**.

```bash
claude mcp add --transport http tlaloc \
  https://api.tlaloc.sh/mx/mcp \
  --header "Authorization: Bearer tlmx_TU_API_KEY"
```

Crea tu API key en https://console.tlaloc.sh · Guía completa en español:
https://www.tlaloc.sh/es/blog/mexico-api-mcp.html

---

<!-- Keywords objetivo (para README + descripción del repo + listados de directorio):
     MCP server Mexico, Mexican data MCP, CURP API MCP, RFC SAT API, SEPOMEX API, CEP SPEI API,
     validar CURP IA, validar RFC API, Model Context Protocol Mexico, Claude/ChatGPT Mexican data. -->
