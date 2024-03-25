
cd ../../susql-demo-workloads

sleep 10
oc delete -f fmperf_tgis.yaml --ignore-not-found=false
oc delete -f mlperf.yaml --ignore-not-found=false
oc delete -f roberta_single.yaml --ignore-not-found=false
oc delete -f fmperf_loadgen.yaml --ignore-not-found=false

cd -

sleep 5

oc delete -f labelgroups-demo1.yaml --ignore-not-found=false
