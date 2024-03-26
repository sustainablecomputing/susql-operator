#!/usr/bin/bash

cd ../deployment

export PROMETHEUS_PROTOCOL=https
export PROMETHEUS_PORT=9091
export PROMETHEUS_NAMESPACE="openshift-monitoring"
export PROMETHEUS_SERVICE="thanos-querier"
export SUSQL_ENHANCED="true"

yes | bash deploy.sh


