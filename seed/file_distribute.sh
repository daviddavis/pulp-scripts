#!/bin/bash

set -ev

name="file-$RANDOM"
url="https://fixtures.pulpproject.org/file/PULP_MANIFEST"

pulp file remote create --name $name --url $url
pulp file repository create --name $name --remote $name
pulp file repository sync --name $name

pub_href=$(pulp file publication create --repository $name --version 1 | jq -r ".pulp_href")
pulp file distribution create --name $name --base-path $name --publication $pub_href

echo "Synced and distributed $name"
