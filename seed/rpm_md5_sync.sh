#!/bin/bash

set -ev

repo_name="md5-repo$RANDOM"
remote_name="md5-remote$RANDOM"
url="https://fixtures.pulpproject.org/rpm-with-md5/"

pulp rpm remote create --name $remote_name --url $url
pulp rpm repository create --name $repo_name --remote $remote_name
pulp rpm repository sync --name $repo_name
pulp rpm publication create --repository $repo_name

echo "Created, synced, and published repo $repo_name"
