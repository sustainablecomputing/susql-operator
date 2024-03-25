sleep 10
oc apply -f labelgroups-demo1.yaml
sleep 10

cd ../../susql-demo-workloads

oc delete -f fmperf_loadgen.yaml --ignore-not-found=false 1>/dev/null 2>&1
oc delete -f fmperf_tgis.yaml --ignore-not-found=false 1>/dev/null 2>&1
oc delete -f mlperf.yaml --ignore-not-found=false 1>/dev/null 2>&1
oc delete -f roberta_single.yaml --ignore-not-found=false 1>/dev/null 2>&1

sleep 10
oc create -f fmperf_loadgen.yaml
sleep 10
oc create -f fmperf_tgis.yaml
oc create -f mlperf.yaml
oc create -f roberta_single.yaml

cd -

sleep 10
echo
../test/susqltop -n fms
sleep 10
echo
../test/susqltop -n fms
sleep 10
echo
../test/susqltop -n fms
