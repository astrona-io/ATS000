# Secrets And Base64

A **Secret** looks like a ConfigMap but is meant for private values: a token, a password. Kubernetes handles it with a little more care.

## Create a Secret

```sh
kubectl create secret generic site-extra-secret --from-literal=key=orbit-12 -n config-lab
kubectl get secret site-extra-secret -n config-lab -o yaml
```

Look at `data:`. The value is not `orbit-12`. It is a string of letters and numbers: that is base64.

## Base64 is not protection

Base64 is an encoding. It turns text into a safe set of characters. Anyone can turn it back.

### Decode it

```sh
kubectl get secret site-extra-secret -n config-lab -o jsonpath='{.data.key}' | base64 --decode
```

On older macOS, use `base64 -D`. You see `orbit-12` again. This is why Secrets need access rules: anyone who can read the Secret can read the value.

### Write one in YAML

In a file, you can use `stringData`, so you do not encode by hand:

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: gate-secret
  namespace: vault-lab
type: Opaque
stringData:
  TOKEN: orbit-77
```

Kubernetes stores it encoded. With `data:` instead, you must give base64 yourself.

## Use it

A Secret is used like a ConfigMap, with `secretKeyRef` for a variable:

```yaml
env:
  - name: TOKEN
    valueFrom:
      secretKeyRef:
        name: gate-secret
        key: TOKEN
```

or as a mounted volume with `secret:` and `secretName:`.

## Common pitfalls

> [!WARNING]
> - **Thinking base64 hides the value.** It does not.
> - **Committing a Secret file to Git.** Anyone with the repository can read it.
> - **Encoding with a trailing newline.** `echo` adds one. Use `echo -n`, or `stringData`.
> - **A wrong key name.** The pod will not start.
> - **Printing Secrets in a shared terminal.** Others can see them.

> *Base64 is only an encoding. Treat a Secret as readable by anyone with access.*
