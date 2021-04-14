#!/bin/bash

set -ev

name="rpm-unsigned-$RANDOM"
url="https://fixtures.pulpproject.org/rpm-unsigned/"
#policy="on_demand"
policy="immediate"

pulp rpm remote create --name $name --url $url --policy $policy
pulp rpm repository create --name $name --remote $name
pulp rpm repository sync --name $name
publication=$(pulp rpm publication create --repository $name | jq -r ".pulp_href")
pulp rpm distribution create --name $name --base-path $name --publication $publication

echo "Created repo $name"
