#!/bin/bash

set -ev

name="ansible-repo-$RANDOM"
url="https://galaxy-dev.ansible.com/"
requirements="collections:\n  - testing.ansible_testing_content"

pulp ansible remote create --name $name --url $url --requirements "$requirements"
pulp ansible repository create --name $name --remote $name
pulp ansible repository sync --name $name

echo "Created and synced repo $repo_name"
