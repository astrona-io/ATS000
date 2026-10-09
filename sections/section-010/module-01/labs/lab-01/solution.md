# Solution Walkthrough

Mission debrief, astronaut. Every lab works the same way: **start it, look, fix, submit**. This walkthrough goes through each step of the first lab and shows what you should see. Type the commands after the `$`; do not type the `$` itself.

---

## Step 1: Start the lab

Catalog labs are tied to your Astrona account, so sign in first with `astrona login` if you have not yet. Then start the lab:

```console
$ astrona run ATS000/section-010/module-01/lab-01
```

The `astrona` tool asks `kind` to build a small Kubernetes cluster on your computer, then sets up the broken app in it. It takes about a minute. When it is done, it prints how to connect.

## Step 2: Open a lab shell

```console
$ astrona shell
```

This opens a shell where `kubectl` talks to your lab's cluster, like a cockpit console tuned to this one solar system. Your own `kubectl` settings are left alone; that is on purpose. Type `exit` to leave it later.

## Step 3: Look at the pods

Run a roll call of the pods on the planet `first-lab`:

```console
$ kubectl get pods -n first-lab
NAME                     READY   STATUS             RESTARTS   AGE
hello-77c765d57b-7zsbx   0/1     ImagePullBackOff   0          20s
hello-77c765d57b-mkpbd   0/1     ImagePullBackOff   0          20s
```

`-n first-lab` means "in the namespace first-lab". Both pods are `0/1`, which means not ready, with the status **ImagePullBackOff**. The kubelet, the agent on the cluster's node, tried to download (pull) the container image and failed. Now it waits a little longer before each new try.

## Step 4: Read why

Copy one of your pod names (yours end in different letters) and open its full flight record:

```console
$ kubectl describe pod hello-77c765d57b-7zsbx -n first-lab
```

Scroll to **Events** at the bottom. You will see a line like this (shortened):

```text
Failed to pull image "nginx:1.27-alpne": … not found
```

Look closely at the image: `alpne`. The real tag is `alpine`: one letter is missing. A tag that does not exist cannot be pulled.

## Step 5: Fix the Deployment

The pods belong to the Deployment `hello`, the fleet order that keeps two of them flying. Change the image in the Deployment, and the Deployment controller replaces both pods for you:

```console
$ kubectl set image deployment/hello web=nginx:1.27-alpine -n first-lab
deployment.apps/hello image updated
```

`web` is the name of the container inside the pod; `nginx:1.27-alpine` is the image it should run. Do not scale the Deployment down or delete the pods: the task asks for 2 replicas, and new pods would come back with the old image.

## Step 6: Check it worked

```console
$ kubectl get pods -n first-lab
NAME                    READY   STATUS    RESTARTS   AGE
hello-8dc757467-p6czq   1/1     Running   0          13s
hello-8dc757467-zqchv   1/1     Running   0          12s
```

Both pods are `1/1` and `Running`. Their names changed too: these are new pods, built from the fixed Deployment. If they still say `ContainerCreating`, wait a few seconds and run the command again.

## Step 7: Submit your response

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

The Proctor checked three things on the live cluster: the `hello` image is `nginx:1.27-alpine`, the Deployment still asks for 2 replicas, and 2 pods are ready. On the Astrona lab page, run it with `-o json` and paste the output to see your time.

## Step 8: Clean up

```console
$ astrona destroy ATS000/section-010/module-01/lab-01
```

That deletes the lab's cluster and frees the memory it used. After a passing submit, `astrona submit` may already have offered to do this for you.

## What you practised

- `kubectl get pods` to see what is running, and `describe` to read why not.
- That a **Deployment** owns its pods: you fix the Deployment, not each pod.
- The loop every lab uses: `astrona run` → work in `astrona shell` → `astrona submit`.
