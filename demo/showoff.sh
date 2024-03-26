
SUSQLTOP=${PWD}/../test/susqltop
echo
echo current energy usage:
${SUSQLTOP} -n fms

cd ../../susql-demo-workloads

echo
echo stop the workloads
echo

oc delete -f fmperf_loadgen.yaml --ignore-not-found=false
oc delete -f fmperf_tgis.yaml --ignore-not-found=false
oc delete -f mlperf.yaml --ignore-not-found=false
oc delete -f roberta_single.yaml --ignore-not-found=false

echo energy usage after stopping workloads:
${SUSQLTOP} -n fms

echo
echo restart the workloads
echo

oc create -f fmperf_loadgen.yaml
sleep 5
oc create -f fmperf_tgis.yaml
oc create -f mlperf.yaml
oc create -f roberta_single.yaml

cd -

sleep 5
echo
${SUSQLTOP} -n fms
sleep 15
echo
${SUSQLTOP} -n fms

