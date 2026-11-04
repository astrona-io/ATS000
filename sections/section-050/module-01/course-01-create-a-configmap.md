# Create A ConfigMap

A **ConfigMap** is a named bundle of key and value pairs. It holds ordinary settings: a greeting, a mode, a colour. There are three ways to make one.

## From literals

The quickest way: name each pair on the command line.

### Try it

```sh
kubectl create configmap site-extra --from-literal=colour=green --from-literal=mode=loud -n config-lab
kubectl get configmap site-extra -n config-lab -o yaml
```

The first line creates a ConfigMap with two keys. The second prints it. Look at the `data:` map in the output.

## From a file

When the setting is a whole file, such as a small config, keep the file as it is.

### Try it

Save a file named `motd.txt` with one line of text, then:

```sh
kubectl create configmap site-motd --from-file=motd.txt -n config-lab
kubectl get configmap site-motd -n config-lab -o yaml
```

The file name becomes the key, and the file content becomes the value.

## From YAML

For anything you want to keep, write the file and apply it. Save as `configmap-gate.yaml`:

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: site-yaml
  namespace: config-lab
data:
  colour: red
  mode: calm
```

```sh
kubectl apply -f configmap-gate.yaml
```

All values in `data` are strings. Quote numbers and words such as `on`: write `"3"`.

## Common pitfalls

> [!WARNING]
> - **Forgetting `-n`.** The ConfigMap lands in `default`, and the pod on another planet cannot see it.
> - **A ConfigMap in another namespace.** A pod only sees ConfigMaps from its own namespace.
> - **An unquoted number in `data`.** Quote it.
> - **A wrong key name.** `GREETING` and `greeting` are different keys.
> - **Storing a secret in a ConfigMap.** Use a Secret.

> *A ConfigMap is a named bundle of strings, in the same namespace as its ship.*
