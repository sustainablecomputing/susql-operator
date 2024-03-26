SUSQLTOP=${PWD}/../test/susqltop

oc apply -f labelgroups-demo1.yaml
sleep 10

cd ../../susql-demo-workloads

oc delete -f fmperf_loadgen.yaml --ignore-not-found=false 1>/dev/null 2>&1
oc delete -f fmperf_tgis.yaml --ignore-not-found=false 1>/dev/null 2>&1
oc delete -f mlperf.yaml --ignore-not-found=false 1>/dev/null 2>&1
oc delete -f roberta_single.yaml --ignore-not-found=false 1>/dev/null 2>&1

oc create -f fmperf_tgis.yaml
sleep 5
oc create -f mlperf.yaml
oc create -f roberta_single.yaml
oc create -f fmperf_loadgen.yaml

cd -

sleep 5
echo
${SUSQLTOP} -n fms
sleep 10
echo
${SUSQLTOP} -n fms
sleep 15
echo
${SUSQLTOP} -n fms
