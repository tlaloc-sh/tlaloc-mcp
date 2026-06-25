// Call the Tlaloc API from Node.js (18+, built-in fetch).
// Get a key (tlmx_...) at https://console.tlaloc.sh
//   TLALOC_API_KEY=tlmx_... node javascript_example.mjs

const KEY = process.env.TLALOC_API_KEY ?? "tlmx_YOUR_API_KEY";
const BASE = "https://api.tlaloc.sh/mx";

async function get(path, params = {}) {
  const url = new URL(`${BASE}${path}`);
  Object.entries(params).forEach(([k, v]) => url.searchParams.set(k, v));
  const res = await fetch(url, { headers: { Authorization: `Bearer ${KEY}` } });
  if (!res.ok) throw new Error(`${res.status} ${res.statusText}`);
  return res.json();
}

console.log("Postal code 06700:", await get("/v1/zip", { code: "06700" }));
console.log("RFC GODE561231GR8:", await get("/v1/rfc", { rfc: "GODE561231GR8" }));
console.log("Phone 5512345678:", await get("/v1/phone", { number: "5512345678" }));
