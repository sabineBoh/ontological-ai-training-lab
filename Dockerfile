
# ============================================================
# Ontological AI Training Lab
# Python 3.11 / LinkML / OntoGPT / Jupyter
# ============================================================

FROM python:3.11-slim

ENV UV_LINK_MODE=copy \
    UV_NO_CACHE=1 \
    PYTHONUNBUFFERED=1

RUN apt-get update && apt-get install -y --no-install-recommends \
    git build-essential curl ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir uv

WORKDIR /work

RUN uv venv /opt/venvs/onto \
&& uv pip install --python /opt/venvs/onto/bin/python \
   ontogpt==1.2.0 linkml==1.12.1 jupyterlab ipykernel "litellm[caching]==1.95.1" \
&& /opt/venvs/onto/bin/python -c \
   "from litellm.types.caching import LiteLLMCacheType as T; \
    assert hasattr(T, 'DISK'), 'litellm incompatible avec ontogpt 1.2.0'"
	
ENV PATH=/opt/venvs/onto/bin:${PATH}

# La clé OpenAI est fournie à l'exécution, jamais dans l'image.
CMD ["bash"]


