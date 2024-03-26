#!/usr/bin/bash

SUSQLTOP=${PWD}/../test/susqltop

echo create labelgroups for demo

oc apply -f labelgroups-demo1.yaml
sleep 10

cd ../../susql-demo-workloads

echo create ai workloads

oc create -f fmperf_tgis.yaml
sleep 5
oc create -f mlperf.yaml
oc create -f roberta_single.yaml
oc create -f fmperf_loadgen.yaml

cd - >/dev/null

sleep 5
echo
${SUSQLTOP} -n fms
sleep 15
echo
${SUSQLTOP} -n fms
sleep 15
echo
${SUSQLTOP} -n fms
