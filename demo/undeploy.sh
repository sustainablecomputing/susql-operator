cd ../deployment

export PROMETHEUS_PROTOCOL=https
export PROMETHEUS_PORT=9091
export PROMETHEUS_NAMESPACE="openshift-monitoring"
export PROMETHEUS_SERVICE="thanos-querier"
export SUSQL_ENHANCED="true"
export SUSQL_SAMPLING_RATE=5
yes | bash deploy.sh susql-undeploy,prometheus-undeploy

cd -

