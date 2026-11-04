# Describe, Events And Logs

When a ship misbehaves, three calls tell you why: `describe` explains the object, `get events` shows what happened lately, and `logs` shows what the program inside wrote.

## Describe

`kubectl describe` prints a readable report about one object, including its recent events at the bottom.

### Try it

```sh
kubectl describe deployment beacon -n harbor
kubectl get pods -n harbor
kubectl describe pod <pod-name> -n harbor
```

Replace `<pod-name>` with a real pod name from the list. In the report of a pod, look at `State`, `Last State`, `Image` and the `Events` section at the bottom.

## Events

Events are short notes the cluster writes when things happen: a ship was scheduled, an image was pulled, a container failed.

### Read them in order

```sh
kubectl get events -n harbor --sort-by=.metadata.creationTimestamp
```

Newest events are at the bottom. Warnings usually point at the problem.

## Logs

`kubectl logs` prints what the program inside the container wrote.

### A log

```sh
kubectl logs deployment/stutter -n harbor
```

The `stutter` container prints `engine is cold` and exits. Because Kubernetes keeps restarting it, you may need the log of the run before:

```sh
kubectl logs <stutter-pod-name> -n harbor --previous
```

`--previous` shows the log of the last finished run of the container.

### Follow a log

```sh
kubectl logs deployment/beacon -n harbor -f
```

`-f` keeps printing new lines. Press Ctrl+C to stop.

> [!TIP]
> Start with `describe` for the story, events for the timing, and logs for the program's own words.

## Common pitfalls

> [!WARNING]
> - **Logs of a pod that never started.** There are none. Read `describe` instead.
> - **Forgetting `--previous`.** A restarting container shows an empty or new log.
> - **A pod with several containers.** Add `-c <container>`.
> - **Reading old events.** Events expire. Sort them.
> - **Skipping the bottom of `describe`.** The `Events` section is the useful part.

> *Describe tells the story, events give the time, logs give the words.*
