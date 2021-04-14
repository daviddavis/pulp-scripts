#!/bin/bash

set -ev

name="file-invalid-$RANDOM"
url="https://fixtures.pulpproject.org/file-invalid/PULP_MANIFEST"

pulp file remote create --name $name --url $url
pulp file repository create --name $name --remote $name
pulp file repository sync --name $name

echo "Created and synced repo $name"
