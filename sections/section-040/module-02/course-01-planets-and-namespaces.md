# Planets And Namespaces

A cluster is split into **namespaces**. In our space story, each namespace is a planet: objects on one planet do not mix with objects on another. This part shows how to see them and how to point a command at one.

## Look at the namespaces

A new command often shows nothing, because it looks at the wrong planet. Learn to look first.

### List them

```sh
kubectl get namespaces
```

You should see `default`, `kube-system`, and the planets of your playground, `harbor` and `harbor-b`. `kube-system` holds the cluster's own parts. Leave it alone.

## Choose a planet

By default, `kubectl` looks at the namespace named `default`. Say which planet you mean.

### With -n

```sh
kubectl get deployments -n harbor
kubectl get deployments -n harbor-b
```

`-n` is short for `--namespace`. The first call lists `beacon` and `stutter`. The second lists `buoy`.

### With -A

```sh
kubectl get deployments -A
```

`-A` means all namespaces. The output gains a `NAMESPACE` column. Use it when you do not know where something lives. A mission that says "find the planet that holds the ship" wants this.

## Find where you are

```sh
kubectl config current-context
```

prints the cluster `kubectl` talks to now. Inside the lab shell it is the lab's cluster.

### Set a default planet

If you work on one planet for a while, you can make it the default for the current context:

```sh
kubectl config set-context --current --namespace=harbor
```

After this, `kubectl get deployments` needs no `-n`. Set it back with `--namespace=default` when you finish, or you will forget and wonder where your objects went.

## Common pitfalls

> [!WARNING]
> - **No resources found in default namespace.** You looked at the wrong planet. Add `-n` or `-A`.
> - **Deleting in the wrong namespace.** Add `-n` to every `delete`.
> - **Forgetting a default you set.** Check with `kubectl config view --minify`.
> - **Touching `kube-system`.** It runs the cluster.
> - **Two planets with one name.** `buoy` and `beacon` live in different namespaces. Read the `NAMESPACE` column.

> *When a list is empty, check the planet before you suspect the ship.*
