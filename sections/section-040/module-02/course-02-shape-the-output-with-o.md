# Shape The Output With -o

`kubectl get` prints a short table. With `-o`, you choose a different shape: wider, just the names, the whole object, or one field.

## Four shapes

Each shape answers a different question.

### Wider

```sh
kubectl get pods -n harbor -o wide
```

`-o wide` adds columns such as the pod's IP address and the node it runs on.

### Names only

```sh
kubectl get pods -n harbor -o name
```

Prints one line per pod, such as `pod/...`. This is the shape for scripts and for pipes.

### The whole object

```sh
kubectl get deployment beacon -n harbor -o yaml
```

Prints the full object, including the `status` that Kubernetes fills in. Use it to see exactly what the cluster holds.

### One field

```sh
kubectl get deployment beacon -n harbor -o jsonpath='{.spec.replicas}'
```

`-o jsonpath` prints just one field. The part in braces is a path through the YAML: `.spec.replicas` follows `spec`, then `replicas`. Graders use the same idea.

## Labels

Objects can carry labels, small tags such as `tier=front`. Use them to filter.

### Show and filter

```sh
kubectl get deployments -n harbor --show-labels
kubectl get deployments -n harbor -l tier=front
```

`--show-labels` adds a column. `-l tier=front` keeps only objects with that label.

## Common pitfalls

> [!WARNING]
> - **Quoting jsonpath wrong.** Put the whole expression in single quotes.
> - **A jsonpath with a typo.** An empty result may mean a wrong path, not a missing value.
> - **Using `-o yaml` output as your file.** It carries `status` and ids you must remove.
> - **Forgetting `-n`.** The output is empty.
> - **Filtering with a wrong label.** Check `--show-labels` first.

> *Table for a glance, yaml for the truth, jsonpath for one field.*
