#!/bin/bash

set -e

cd $1
rm PULP_MANIFEST || true

for file in $(find . -type f)
do
  echo "${file/.\/},$(sha256sum "$file" | awk '{print $1}'),$(stat -c '%s' "$file")" \
    >> "PULP_MANIFEST"
done

echo "Created $1/PULP_MANIFEST."
