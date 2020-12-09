#!/bin/bash

set -ev

repo_name="repo$RANDOM"
remote_name="remote$RANDOM"
url="https://fixtures.pulpproject.org/file/PULP_MANIFEST"

pulp file remote create --name $remote_name --url $url
pulp file repository create --name $repo_name --remote $remote_name
pulp file repository sync --name $repo_name

echo "Created repo $repo_name"
