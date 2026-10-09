# Step-by-step: Bring A Deployment Back To Life

Every lab works the same way: **start it, look, fix, submit**. This one walks
through each step and shows what you should see. Type the commands after the
`$` — do not type the `$` itself.

## 1. Start the lab

```console
$ astrona run ATS000/section-010/module-01/lab-01
```

astrona builds a small Kubernetes cluster on your computer and sets up the
broken app. It takes about a minute. When it is done it prints how to connect.

## 2. Open a lab shell

```console
$ astrona shell
```

This opens a shell where `kubectl` talks to your lab's cluster. (Your normal
terminal is left alone — that is on purpose.) Type `exit` to leave it later.

## 3. Look at the pods

```console
$ kubectl get pods -n first-lab
NAME                     READY   STATUS             RESTARTS   AGE
hello-77c765d57b-7zsbx   0/1     ImagePullBackOff   0          20s
hello-77c765d57b-mkpbd   0/1     ImagePullBackOff   0          20s
```

`-n first-lab` means "in the namespace first-lab". Both pods are
`0/1` — not ready — with the status **ImagePullBackOff**: Kubernetes tried to
download the container image and failed.

## 4. Read why

Copy one of your pod names (yours end in different letters):

```console
$ kubectl describe pod hello-77c765d57b-7zsbx -n first-lab
```

Scroll to **Events** at the bottom. You will see a line like:

```text
Failed to pull image "nginx:1.27-alpne": … not found
```

Look closely at the image: `alpne`. The real tag is `alpine` — one letter is
missing.

## 5. Fix the Deployment

The pods belong to the Deployment `hello`. Change its image, and the
Deployment replaces both pods for you:

```console
$ kubectl set image deployment/hello web=nginx:1.27-alpine -n first-lab
deployment.apps/hello image updated
```

`web` is the name of the container inside the pod; `nginx:1.27-alpine` is the
image it should run.

## 6. Check it worked

```console
$ kubectl get pods -n first-lab
NAME                    READY   STATUS    RESTARTS   AGE
hello-8dc757467-p6czq   1/1     Running   0          13s
hello-8dc757467-zqchv   1/1     Running   0          12s
```

Both pods are `1/1` and `Running`. If they still say `ContainerCreating`, wait
a few seconds and run the command again.

## 7. Submit your response

Leave the lab shell, then submit:

```console
$ exit
$ astrona submit ATS000/section-010/module-01/lab-01
```

```text
3 passed, 0 failed
Score: 4/4 points (100%)

PROCTOR: PASS
```

On https://astrona.io/labs, run it with `-o json` and paste the output to see
your time.

## 8. Clean up

```console
$ astrona destroy ATS000/section-010/module-01/lab-01
```

That deletes the lab's cluster and frees the memory it used.

## What you practised

- `kubectl get pods` to see what is running, and `describe` to read why not.
- That a **Deployment** owns its pods: you fix the Deployment, not each pod.
- The loop every lab uses: `astrona run` → work in `astrona shell` → `astrona submit`.
