#!/bin/bash

set -ev

repo_name="ansible-repo-$RANDOM"
url="https://galaxy-dev.ansible.com/"
#requirements="collections:\n  - testing.ansible_testing_content"
requirements="collections:\n- name: testing.ansible_testing_content\n  version: '>=1.0.0,<=2.0.0'\n  source: https://galaxy-dev.ansible.com/\n- testing.k8s_demo_collection"

pulp ansible remote create --name $repo_name --url $url --requirements "$requirements"
pulp ansible repository create --name $repo_name --remote $repo_name
pulp ansible repository sync --name $repo_name

echo "Created and synced repo $repo_name"
