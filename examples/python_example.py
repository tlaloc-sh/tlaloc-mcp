"""Call the Tlaloc API from Python. Get a key (tlmx_...) at https://console.tlaloc.sh

    pip install requests
    TLALOC_API_KEY=tlmx_... python python_example.py
"""
import os

import requests

KEY = os.environ.get("TLALOC_API_KEY", "tlmx_YOUR_API_KEY")
BASE = "https://api.tlaloc.sh/mx"
HEADERS = {"Authorization": f"Bearer {KEY}"}


def get(path: str, **params):
    r = requests.get(f"{BASE}{path}", headers=HEADERS, params=params, timeout=30)
    r.raise_for_status()
    return r.json()


if __name__ == "__main__":
    print("Postal code 06700:", get("/v1/zip", code="06700"))
    print("RFC GODE561231GR8:", get("/v1/rfc", rfc="GODE561231GR8"))
    print("Phone 5512345678:", get("/v1/phone", number="5512345678"))
