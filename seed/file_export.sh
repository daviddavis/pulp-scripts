#!/bin/bash

set -ev

path=$(dirname "$0")
exporter="exporter$RANDOM"
exporter_path="/data"

. ./$path/file_sync.sh

pulp exporter pulp create --name $exporter --path $exporter_path --repository $repo_name file
pulp export pulp run --exporter $exporter

export_path=$(pulp export pulp list --exporter $exporter | jq -r '.[0].output_file_info | keys[] | select(contains("tar"))')

echo "Exported to $export_path"
