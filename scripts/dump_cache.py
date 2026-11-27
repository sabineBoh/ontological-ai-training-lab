"""Affiche les réponses du LLM gardées dans le cache d'OntoGPT/litellm.

Usage (depuis le dossier du projet) :
  docker compose run --rm -T outils python /work/dump_cache.py
Le script signale les réponses qui contiennent une ligne de champ vide
(par exemple « name: » sans valeur), cause de l'erreur
« Empty value in key-value line ». Aucun appel au LLM, donc aucun coût.
"""
import json
import re
import sys

import diskcache

CACHE_DIR = sys.argv[1] if len(sys.argv) > 1 else "/work/.litellm_cache"
cache = diskcache.Cache(CACHE_DIR)
vide = re.compile(r"^\s*[-*]*\s*[\w ]+:\s*$", re.MULTILINE)

total = suspects = 0
for key in cache:
    entree = cache[key]
    reponse = entree.get("response") if isinstance(entree, dict) else entree
    if isinstance(reponse, str):
        reponse = json.loads(reponse)
    texte = reponse["choices"][0]["message"]["content"]
    total += 1
    if vide.search(texte):
        suspects += 1
        print("=" * 70)
        print("REPONSE AVEC UNE LIGNE DE CHAMP VIDE :")
        print(texte)

print("=" * 70)
print(f"{total} réponses en cache, {suspects} avec un champ vide.")
