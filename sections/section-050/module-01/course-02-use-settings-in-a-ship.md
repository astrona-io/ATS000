# Use Settings In A Ship

A ConfigMap does nothing until a pod uses it. There are two ways: as environment variables and as files.

## As environment variables

The container sees each key as a variable.

### One key

```yaml
env:
  - name: GREETING
    valueFrom:
      configMapKeyRef:
        name: gate-config
        key: GREETING
```

The variable `GREETING` gets the value of the key `GREETING` in the ConfigMap `gate-config`.

### Every key

```yaml
envFrom:
  - configMapRef:
      name: site-config
```

Every key of `site-config` becomes a variable. Check it in the playground:

```sh
kubectl exec deploy/site -n config-lab -- env
```

## As files

A ConfigMap can be mounted as a folder. Each key becomes a file.

### Mount it

```yaml
volumes:
  - name: settings
    configMap:
      name: site-config
containers:
  - name: web
    image: nginx:1.27-alpine
    volumeMounts:
      - name: settings
        mountPath: /etc/site
```

Look inside:

```sh
kubectl exec deploy/site -n config-lab -- ls /etc/site
```

## What updates when

Change a value, and see what the pod notices.

### Try it

```sh
kubectl edit configmap site-config -n config-lab
```

Change `colour`, save, then read both again. The mounted files change after a short while. The environment variables do **not** change in a running container. They are read once, at start.

```sh
kubectl rollout restart deployment/site -n config-lab
```

A restart builds new pods, and they read the new values.

## Common pitfalls

> [!WARNING]
> - **Expecting env vars to update.** Restart the Deployment.
> - **A mount over a folder with files.** The mount hides what was there.
> - **A wrong `name:` in a reference.** The pod will not start.
> - **A key that is not in the ConfigMap.** The pod will not start.
> - **Editing the pod.** Edit the Deployment.

> *Environment variables are read once. Mounted files follow the ConfigMap.*
