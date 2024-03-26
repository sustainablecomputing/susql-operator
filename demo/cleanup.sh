#!/usr/bin/bash

cd ../../susql-demo-workloads

oc delete -f fmperf_tgis.yaml --ignore-not-found=false
oc delete -f mlperf.yaml --ignore-not-found=false
oc delete -f roberta_single.yaml --ignore-not-found=false
oc delete -f fmperf_loadgen.yaml --ignore-not-found=false

cd - >/dev/null

sleep 2

oc delete -f labelgroups-demo1.yaml --ignore-not-found=false
