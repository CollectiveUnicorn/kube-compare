#!/usr/bin/env bash

folder=${args[--folder]}
quiet=${args[--quiet]}

shopt -s globstar # Allows the * lookup to work with bash
for f in "$folder"/**/*.yaml; do
  if kubectl diff -f "$f"; then
    if [ -z "$quiet" ]; then
      echo "No changes detected for $(basename "$f")"
    fi
  fi
done