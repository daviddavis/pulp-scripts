#!/bin/bash

set -ev

path=$(dirname "$0")
importer="test$RANDOM"

. ./$path/file_export.sh

importer_href=$(http :/pulp/api/v3/importers/core/pulp/ name=$importer | jq -r '.pulp_href')
http :${importer_href}imports/ path=$export_path

