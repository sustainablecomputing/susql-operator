# Using SusQL with the Green Software Foundation's Impact Framework

The following README explains an approach to utilize SusQL data in the
Green Software Foundation's Impact Framework using a slightly modified version
of the PrometheusImporter plugin.  The fundamental focus of this particular
approach is to run entirely on Cluster, and is based on OpenShift.

The key to importing data from SusQL is a Prometheus Importer Plugin for the GSF Impact Framework.
Currently there are two such plugins described in the [IF Explorer](https://explorer.if.greensoftware.foundation):
- [`Prometheus Importer`](https://github.com/andreic94/if-prometheus-importer/blob/main/README.md) by `andreic94`, et al.
- [`prometheus-importer`](https://github.com/Shivani-G/prometheus-importer/blob/main/README.md) by `Shivani-G`.

This approach uses the later plugin.

However, this is a work in progress related to an apparent limitation
in the use of certain required global`nodejs` functionality within a container.

### Using prebuilt container image:
- Ensure that you are logged into your cluster, then start the Impact Framework container: `oc apply -f impact-framework.yaml`
- Log into the newly created container: `oc rsh impact-framework bash`
- Try simple unit test:
```
cd if
npm run if-run -- --manifest manifests/examples/builtins/sum/success.yml
```
- Use SusQL data: (Edit HOST and BEARER_TOKEN as necessary.)
```
cd if
echo "BEARER_TOKEN="$(cat  /var/run/secrets/kubernetes.io/serviceaccount/token) >>.env
echo "HOST=https://thanos-querier.openshift-monitoring.svc.cluster.local:9091" >>.env
npm run if-run -- --manifest ../ptest.yaml
```

### Building your own container image
For those who wish to build their own Impact Framework, log into both your 
cluster and your container image repository, and run the following commands:
```
export IMG=<YOURIMAGEREPO>/<YOURID>/<YOURIMAGENAME
podman build --tag ${IMG} .
podman push ${IMG}
```
Then edit `impact-framework.yaml` so that `image` points to your newly built image.

Notes:
- `oc` and `kubectl` are (should be) interchangable in this context.
- `podman` and `docker` are (should be) interchangable in this context.
