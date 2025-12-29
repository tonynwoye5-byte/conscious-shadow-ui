
# NVIDIA DGX Cloud Integration (Hosted NIM + Riva)

This repository is configured to deploy and run against **NVIDIA DGX Cloud hosted services**:
- **NIM LLM** (OpenAI-like APIs for chat/completions)
- **Riva ASR/TTS** (speech-to-text, text-to-speech via NVIDIA API Catalog)

> **Do not commit real keys.** Use environment secrets and your local `.env.local` only.

---

## 1) Prerequisites

- Your **DGX Cloud environment** created in GitHub:
  - Go to **Repo → Settings → Environments** and create `dgx-cloud-prod`.
  - Add the following **Environment secrets**:
    - `NGC_API_KEY` – NGC API key from NVIDIA NGC.
    - `NIM_API_URL` – `https://<dgxcloud-nim-endpoint>:8000/v1`.
    - `NVIDIA_SPEECH_API_KEY` – NVIDIA API Catalog key for speech.
    - `RIVA_ASR_FUNCTION_ID` – ASR function ID from API Catalog → “Try API”.
    - `RIVA_TTS_FUNCTION_ID` – TTS function ID from API Catalog → “Try API”.

- Optional **Environment variables** (non-sensitive) in the same environment:
  - `VECTOR_DIM=768`
  - `INDEX_TYPE=IVF-Flat`
  - `NLIST=4096`
  - `TOPK=10`

---

## 2) Local Development

1. Duplicate `.env.local.example` → `.env.local`.
2. Fill real values for:
   - `NIM_API_URL`
   - `NGC_API_KEY`
   - `RIVA_API_URI`, `NVIDIA_SPEECH_API_KEY`
   - `RIVA_ASR_FUNCTION_ID`, `RIVA_TTS_FUNCTION_ID`
3. Start your app (example for Node projects):
   ```bash
   npm run dev
