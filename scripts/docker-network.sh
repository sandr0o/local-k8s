#!/bin/sh
set -o errexit

reg_name='kind-registry'

# Connect the local Docker registry with the kind network
docker network connect "kind" "${reg_name}" > /dev/null 2>&1 &