# Tlaloc MCP Server

**Connect Claude, ChatGPT, and any AI assistant to official Mexican data.**

The Tlaloc MCP (Model Context Protocol) server gives AI assistants and agents live,
authenticated access to official Mexican data sources: **CURP** (RENAPO), **RFC** (SAT),
**postal codes** (SEPOMEX), **phone numbers** (IFT), **SPEI payment receipts / CEP**
(Banxico), **CFDI status** (SAT), **semantic search over the Diario Oficial de la
Federación** (DOF), and **geocoding with the official Mexican geostatistical framework**
(INEGI/INE). Pay per call in MXN via SPEI — no credit card, no subscription.

**22 read-only tools, one API key.** This is a *data lookup* server — an assistant asks a
question and gets an authoritative answer. It is not a KYC/onboarding workflow platform:
there are no sessions to create, no state to manage, nothing to write.

## Why

- **AI-native.** Validate a CURP, verify an RFC, search the DOF, or geocode an address
  straight from your assistant or agent — no glue code.
- **Official sources.** RENAPO, SAT, SEPOMEX, IFT, Banxico, DOF, INEGI/INE.
- **The full Mexican catalog.** Identity, tax, addresses, payments, the official gazette
  and the geostatistical framework — under one `tlmx_` API key.
- **Fair, transparent pricing.** Pay per call, published per tool (below). Prepaid via
  SPEI, no minimum, no monthly fee.

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

Prices in MXN units (**1 unit = $1 MXN, VAT included**). Tools marked **free** cost nothing
to call.

### Identity — CURP (RENAPO)

| Tool | What it does | Price |
|------|--------------|-------|
| `consultar_curp` | Validate a CURP and return its data | 0.25 |
| `crear_batch_curp` | Create a batch of CURP lookups (up to 500) | 0.25 / unique item |
| `consultar_batch_curp` | Batch summary and progress | free |
| `listar_items_batch_curp` | Paginated batch items | free |
| `cancelar_batch_curp` | Cancel a running batch | free |

### Tax — RFC & CFDI (SAT)

| Tool | What it does | Price |
|------|--------------|-------|
| `validar_rfc` | Verify an RFC: exists, active, can issue invoices | 0.10 |
| `estado_cfdi` | Check a CFDI's status by UUID (public SAT service) | 0.05 |
| `consultar_cfdi_sat` | Query CFDIs issued/received in the SAT portal (async) | 0.30 |
| `estado_consulta_cfdi` | Poll the result of an async CFDI query | free |

### Addresses & phones

| Tool | What it does | Source | Price |
|------|--------------|--------|-------|
| `consultar_codigo_postal` | Postal code → neighborhoods, city, state | SEPOMEX | 0.01 |
| `consultar_telefono` | Phone number → carrier and portability | IFT | 0.01 |

### Payments — SPEI / CEP (Banxico)

| Tool | What it does | Price |
|------|--------------|-------|
| `descargar_cep` | Download a SPEI payment receipt (CEP) | 0.10 |
| `consultar_cep` | Verify a SPEI CEP | 0.10 |
| `listar_instituciones_cep` | List the CEP institutions catalog | free |

### Official gazette — DOF (Diario Oficial de la Federación)

Semantic + keyword search over Mexico's official gazette, **2002–present**, with a named
entity layer (agencies, NOMs, decrees, people).

| Tool | What it does | Price |
|------|--------------|-------|
| `buscar_dof` | Search DOF publications by meaning or keywords | 0.05 |
| `buscar_subsecciones_dof` | Same, returning matching subsections (article/annex) | 0.05 |
| `buscar_entidades_dof` | Autocomplete DOF entities (agencies, NOMs, decrees) | 0.05 |
| `unidades_por_entidad_dof` | Where a given entity is mentioned | 0.05 |
| `obtener_documento_dof` | Full text of a publication + detected entities | 0.10 (1.00 with `highlights`) |
| `indice_ejemplar_dof` | Table of contents of a full DOF issue | 0.10 |

### Geo — geocoding & official geostatistical framework (INEGI / INE)

| Tool | What it does | Price |
|------|--------------|-------|
| `geocodificar_direccion` | Geocode a Mexican address (rooftop ~12 m, confidence, method) | 0.05 |
| `consultar_marco_geografico` | Reverse: state, municipality, AGEB, block, postal code, official INE *colonia* | 0.02 |

## Example prompts

- *"Validate this CURP and tell me if it's valid and who it belongs to."*
- *"Is RFC GODE561231GR8 active and able to issue invoices (CFDI)?"*
- *"What did the DOF publish about remote work (teletrabajo)?"*
- *"Find every DOF publication that mentions NOM-035-STPS-2018."*
- *"Geocode 'Av. Reforma 222, Cuauhtémoc, CDMX' and tell me which colonia it falls in."*
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
- **DOF search:** https://www.tlaloc.sh/en/services/dof.html
- **Guide (EN):** https://www.tlaloc.sh/en/blog/mexico-api-mcp.html
- **Contact:** hello@tlaloc.sh

---

## Español

Servidor **MCP** de Tlaloc: conecta **Claude, ChatGPT y cualquier asistente de IA** con
datos oficiales de México — **CURP** (RENAPO), **RFC** y **estado de CFDI** (SAT), **códigos
postales** (SEPOMEX), **teléfonos** (IFT), **comprobantes SPEI/CEP** (Banxico), **búsqueda
semántica del Diario Oficial de la Federación** (DOF) y **geocodificación con el marco
geográfico oficial** (INEGI/INE). Pago por consulta vía **SPEI, sin tarjeta**.

**22 herramientas de solo lectura, una sola API key.** Es un servidor de *consulta de
datos*: el asistente pregunta y obtiene una respuesta autoritativa. No es una plataforma de
flujos KYC/onboarding — no hay sesiones que crear ni estado que administrar.

```bash
claude mcp add --transport http tlaloc \
  https://api.tlaloc.sh/mx/mcp \
  --header "Authorization: Bearer tlmx_TU_API_KEY"
```

Crea tu API key en https://console.tlaloc.sh · Guía completa en español:
https://www.tlaloc.sh/es/blog/mexico-api-mcp.html · Búsqueda del DOF:
https://www.tlaloc.sh/es/services/dof.html

---

<!-- Keywords objetivo (para README + descripción del repo + listados de directorio):
     MCP server Mexico, Mexican data MCP, CURP API MCP, RFC SAT API, SEPOMEX API, CEP SPEI API,
     DOF API, Diario Oficial API, geocoding Mexico MCP, marco geoestadístico INEGI API,
     validar CURP IA, validar RFC API, Model Context Protocol Mexico, Claude/ChatGPT Mexican data. -->
