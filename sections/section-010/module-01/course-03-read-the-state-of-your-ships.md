# Read The State Of Your Ships

Astronaut, a good pilot looks before touching the controls. In Kubernetes, looking means two `kubectl` commands: `kubectl get` tells you *that* something is wrong, and `kubectl describe` usually tells you *why*.

This part teaches the few Kubernetes words you need to read their output, using real output from the first lab. At the end, you fly that lab yourself.

## Planets, ships and fleet orders

Kubernetes has many kinds of objects, but the first lab needs only four. Each one has a space picture that you can keep for every later lab.

### Namespace: the planet

A **namespace** is a named area inside the cluster. It keeps one group of things apart from another. Picture the cluster as a solar system and each namespace as a planet in it.

The first lab's app lives on the planet `first-lab`. Most `kubectl` commands need to know which planet you mean, so you add `-n first-lab` ("in the namespace first-lab"). Without `-n`, `kubectl` looks in the namespace called `default`, and finds nothing there.

### Pod and container: the ship and its modules

A **pod** is one running copy of an app. Picture it as a spaceship. Inside a pod run one or more **containers**: the boxed-up programs that do the work. Picture each container as a module inside the ship, with the app as its crew.

In the first lab, each pod has one container, named `web`, that runs the nginx web server.

### Deployment: the fleet order

A **Deployment** keeps the right number of pods running and replaces them when they break. Picture it as a fleet order: "keep this many ships of this design flying". The number of ships is called `replicas`. The `hello` Deployment in the first lab asks for 2.

The Deployment is the boss of its pods. A part of Kubernetes called the Deployment controller, which runs in the control plane (mission control), reads the fleet order and builds or replaces pods to match it. So when the pods are wrong, you fix the Deployment, not each pod. If you delete a broken pod, the Deployment controller simply builds a new one from the same broken order.

### Container image: the blueprint

A container is built from a **container image**: a packaged copy of the program and everything it needs. Picture it as the ship's blueprint. An image name has two parts, split by a colon:

| Part | Example | Meaning |
| --- | --- | --- |
| Name | `nginx` | Which program |
| Tag | `1.27-alpine` | Which version of it |

So `nginx:1.27-alpine` means "nginx, version 1.27, built on Alpine Linux". Before a ship can launch, the **kubelet**, the agent that runs on each node (launch pad) of the cluster, has to get the image. Getting it is called **pulling** the image. Usually the kubelet downloads it from an image registry, a big online archive of blueprints. If the tag does not exist, the pull fails and the ship never launches.

## Roll call with kubectl get

`kubectl get pods` is a roll call: every ship on the planet answers with its name and its state. It is the first command to run in almost every lab.

### Read a healthy roll call

Here is the roll call on the planet `first-lab` when everything works:

```console
$ kubectl get pods -n first-lab
NAME                    READY   STATUS    RESTARTS   AGE
hello-8dc757467-p6czq   1/1     Running   0          13s
hello-8dc757467-zqchv   1/1     Running   0          12s
```

Each column tells you one thing:

| Column | What it says |
| --- | --- |
| `NAME` | The pod's name: the Deployment's name, then a code for this version of the Deployment, then a code for this one pod |
| `READY` | How many containers in the pod are ready, out of how many. `1/1` means all of them |
| `STATUS` | The pod's state. `Running` means it is up |
| `RESTARTS` | How often a container has restarted |
| `AGE` | How long ago the pod was created |

Two pods, both `1/1` and `Running`: the fleet order asks for 2 ships, and 2 ships are in flight.

### Read a broken roll call

Now the same roll call when something is wrong:

```console
$ kubectl get pods -n first-lab
NAME                     READY   STATUS             RESTARTS   AGE
hello-77c765d57b-7zsbx   0/1     ImagePullBackOff   0          20s
hello-77c765d57b-mkpbd   0/1     ImagePullBackOff   0          20s
```

Both pods are `0/1`: not ready. The status is **ImagePullBackOff**. It means the kubelet tried to pull the container image and failed. Now it "backs off": it waits a little longer before each new try. The ship is stuck on the launch pad because the blueprint never arrived.

Anything other than `Running` is a clue. Another status you may see for a few seconds is `ContainerCreating`: the pod is still starting, so wait and run the command again.

## The flight record with kubectl describe

`kubectl get` tells you *that* a pod is stuck. To find out *why*, open the pod's full flight record with `kubectl describe pod`.

### Find the Events

Copy one pod name from the roll call (yours will end in different letters) and describe it:

```console
$ kubectl describe pod hello-77c765d57b-7zsbx -n first-lab
```

The output is long. Scroll to the **Events** list at the bottom. Events are mission control's log book: short notes on what happened to this pod, oldest first and newest at the bottom. For a pod in `ImagePullBackOff`, you find a line like this (shortened):

```text
Failed to pull image "nginx:1.27-alpne": … not found
```

The event names the exact image the kubelet tried to pull, and says it was not found. Now compare that image with the one you expect, letter by letter.

> [!TIP]
> When a pod is not `Running`, go straight to the Events at the bottom of `kubectl describe pod`. In most cases, the last few lines tell you exactly what went wrong.

### Fix the fleet order, not the ship

Once you know the right image, change it in the Deployment. One way is `kubectl set image`, which sends a new blueprint version to a fleet order:

```text
kubectl set image deployment/<deployment> <container>=<image> -n <namespace>
```

You give it the Deployment, the name of the container inside the pod, and the new image. The Deployment controller then builds new pods with the new image and removes the old ones. You do not touch the pods yourself. That is also why the pods' names change after a fix: the middle code belongs to the new version of the Deployment.

## Common pitfalls

> [!WARNING]
> - **Forgetting `-n`.** Without `-n first-lab`, `kubectl` looks in the `default` namespace and finds no pods. The app is still there, on another planet.
> - **Fixing or deleting the pods.** The Deployment builds them again from the same order. Fix the Deployment.
> - **Scaling the Deployment down to hide the problem.** Fewer broken pods are still broken pods, and the task usually says how many replicas to keep.
> - **Reading only the top of `kubectl describe`.** The reason is almost always in the Events at the bottom.
> - **Skimming the image name.** One missing letter in a tag is enough to stop a launch. Compare it letter by letter.

> *`kubectl get` says that a ship is stuck; `kubectl describe` says why. Then you fix the fleet order, and Kubernetes rebuilds the ships.*

## Your mission: Your First Lab: Bring A Deployment Back To Life

You can now read a roll call, find the reason in the Events, and know that the fix belongs in the Deployment. Your mission: a two-pod app called `hello` never started, and you have to bring it back to life with the image `nginx:1.27-alpine`, keeping 2 replicas.

Start the mission (sign in with `astrona login` first, if you have not yet):

```sh
astrona run ATS000/section-010/module-01/lab-01
```

Read the task in [`question.md`](./labs/lab-01/question.md) and solve it on your own first, in a lab shell (`astrona shell`). When you think you are done, leave the lab shell and send it for grading:

```sh
astrona submit ATS000/section-010/module-01/lab-01
```

When the mission is done, remove it:

```sh
astrona destroy ATS000/section-010/module-01/lab-01
```
