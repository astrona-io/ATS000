# Exec And Port-Forward

Sometimes reading is not enough. `kubectl exec` runs a command inside a ship. `kubectl port-forward` opens a door from your computer to a ship or a Service.

## Run a command inside

Pods have a small Linux inside. You can run commands there.

### One command

```sh
kubectl exec deploy/beacon -n harbor -- ls /usr/share/nginx/html
```

Everything after `--` runs inside the container. Without `--`, `kubectl` may mistake your flags for its own.

### An interactive shell

```sh
kubectl exec -it deploy/beacon -n harbor -- sh
```

`-it` gives you a prompt inside the pod. Try `wget -qO- localhost` to read its web page. Leave with `exit`.

### Write a file

```sh
kubectl exec deploy/beacon -n harbor -- sh -c 'echo hello > /tmp/note.txt'
```

The `sh -c '...'` form lets the redirect `>` run inside the pod. A file written this way lives only as long as this container does. If the pod is replaced, the file is gone.

## Reach a Service

A ship has no public door. `port-forward` opens one for you, only while the command runs.

### Forward a port

```sh
kubectl port-forward service/beacon 8080:80 -n harbor
```

Port 8080 on your computer now leads to port 80 of the Service. In another terminal, run `curl http://127.0.0.1:8080`, or open the address in a browser. Stop with Ctrl+C.

## Your mission: Write A Note Inside A Ship

Pause the playground, then start the mission:

```sh
astrona stop ats-000-playground-040-02
astrona run ATS000/section-040/module-02/lab-01
```

Read the task in [`question.md`](./labs/lab-01/question.md), work in `astrona shell`, then submit. When it passes:

```sh
astrona destroy ats-000-lab-040-02-01
astrona start ats-000-playground-040-02
```

## Common pitfalls

> [!WARNING]
> - **Forgetting `--`.** `kubectl` may read your flags.
> - **A redirect outside `sh -c`.** It runs on your computer, not in the pod.
> - **Restarting the pod after writing.** The file is lost.
> - **Port already in use.** Pick another local port, such as `8081:80`.
> - **Closing the terminal.** The forward ends with it.

> *`exec` goes in, `port-forward` opens a door. Both end when you stop them.*
