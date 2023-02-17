#!/usr/bin/env bash

set -e

CURRENT_CONTEXT=$(kubectl config current-context)
NAMESPACES=$(kubectl --context "${CURRENT_CONTEXT}" get ns -o jsonpath="{.items[*].metadata.name}")

folder=${args[--folder]}
resources=${args[--resources]}

if [ "$resources" = "" ]; then
  # Dump all resource types
  RESOURCES=$(kubectl api-resources --namespaced -o name | tr "\n" " ")
else
  RESOURCES="$resources"
fi

for ns in ${NAMESPACES}; do
  for resource in ${RESOURCES}; do
    rsrcs=$(kubectl --context "${CURRENT_CONTEXT}" -n "${ns}" get -o json "${resource}" | jq -r '.items[].metadata.name')
    for r in ${rsrcs}; do
      dir="${folder}/${CURRENT_CONTEXT}/${ns}/${resource}"
      mkdir -p "${dir}"
      kubectl --context "${CURRENT_CONTEXT}" -n "${ns}" get -o yaml "${resource}" "${r}" >"${dir}/${r}.yaml"
    done
  done
done