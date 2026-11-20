
# ============================================================
# Ontological AI Training Lab
# Python 3.11 / LinkML / OntoGPT / CurateGPT / OntoLearner
# ============================================================

FROM python:3.11-slim

# ------------------------------------------------------------
# System dependencies
# ------------------------------------------------------------

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    build-essential \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# ------------------------------------------------------------
# UV package manager
# ------------------------------------------------------------

RUN pip install --no-cache-dir uv

ENV UV_LINK_MODE=copy
ENV UV_NO_CACHE=1

# ------------------------------------------------------------
# Python virtual environments
# ------------------------------------------------------------

ENV VENVS=/opt/venvs

# 1. LinkML + OntoGPT
RUN uv venv $VENVS/onto \
    && uv pip install --python $VENVS/onto/bin/python \
       ontogpt linkml

# 2. CurateGPT
RUN uv venv $VENVS/curate \
    && uv pip install --python $VENVS/curate/bin/python \
       curategpt

# 3. OntoLearner + PyTorch CPU
RUN uv venv $VENVS/learner \
    && uv pip install --python $VENVS/learner/bin/python \
       ontolearner \
       --extra-index-url https://download.pytorch.org/whl/cpu

# ------------------------------------------------------------
# Environment configuration
# ------------------------------------------------------------

ENV VENV_ONTO=/opt/venvs/onto
ENV VENV_CURATE=/opt/venvs/curate
ENV VENV_LEARNER=/opt/venvs/learner

# OpenAI API key is supplied at runtime.
# NEVER store the key in the Docker image.

WORKDIR /work

# ------------------------------------------------------------
# Default command
# ------------------------------------------------------------

CMD ["bash"]

