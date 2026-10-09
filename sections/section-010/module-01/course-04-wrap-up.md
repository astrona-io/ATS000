# Wrap-Up: Mission Debrief

Well flown, astronaut. You have finished your first module and your first mission. Before you move on, look back at what you learned, check yourself, and make sure no lab is left running.

## What you learned

This module was about the lab loop, the five moves you will make in every Astrona lab, and the first `kubectl` commands you need to make them.

**From [Get Your Machine Ready](./course-01-get-your-machine-ready.md):**

- A lab is a whole Kubernetes cluster on your own computer: a training solar system in a simulator.
- Four tools work together. `astrona` runs the lab, `kind` builds the cluster, Docker or Podman holds it, and `kubectl` is how you talk to it.
- `astrona setup` installs what is missing and asks before each step. `astrona check` shows a ✓ on every "Required" line when the computer is ready.
- When a lab will not start, run `astrona check` first.

**From [The Four Steps Of Every Mission](./course-02-the-four-steps-of-every-mission.md):**

- The loop is start (`astrona run`), look, fix, submit (`astrona submit`), then clean up (`astrona destroy`).
- Catalog labs need `astrona login` once.
- `astrona shell` opens a shell where `kubectl` talks only to the lab's cluster. `exit` leaves it.
- The Proctor grades the live cluster, check by check. A failed check shows a hint. You can submit as often as you like.
- `astrona list` shows which labs are still running.

**From [Read The State Of Your Ships](./course-03-read-the-state-of-your-ships.md):**

- A namespace is a planet, a pod is a ship, a container is a module inside it, and a Deployment is the fleet order that keeps the right number of ships flying.
- An image name is a name and a tag, split by a colon: `nginx:1.27-alpine`. If the tag does not exist, the kubelet cannot pull the image.
- `kubectl get pods -n <namespace>` is the roll call. `READY 1/1` and `Running` mean the pod is up; `ImagePullBackOff` means the image could not be pulled.
- The **Events** at the bottom of `kubectl describe pod` usually say why.
- Fix the Deployment, not the pods. The Deployment controller replaces the pods for you.

## Your missions

You proved the loop in a graded mission, right after the part that taught it:

| Mission | After the part | What you proved |
| --- | --- | --- |
| [Your First Lab: Bring A Deployment Back To Life](./labs/lab-01/README.md) | Read The State Of Your Ships | start a lab, find why pods do not start, fix the Deployment's image and get a passing grade |

If you skipped it, go back to it now. It takes about 10 minutes.

## Check yourself

Try to answer each question before you open the answer.

<details>
<summary>1. You type <code>kubectl get pods</code> and see no pods, but the task says the app is there. What did you forget?</summary>

The namespace. Without `-n`, `kubectl` looks in the `default` namespace. Add `-n first-lab`, or whatever namespace the task names.
</details>

<details>
<summary>2. A pod shows <code>0/1</code> and <code>ImagePullBackOff</code>. What does that mean, and where do you look next?</summary>

The kubelet could not pull the container image, and it now waits longer before each new try. Look at the Events at the bottom of `kubectl describe pod <name> -n <namespace>`: they name the image that failed.
</details>

<details>
<summary>3. Why do you fix the Deployment and not the pods?</summary>

The Deployment is the fleet order. Its controller builds pods from it. If you delete a broken pod, it is rebuilt from the same broken order. Change the order, and the controller replaces every pod with a good one.
</details>

<details>
<summary>4. What are the two parts of <code>nginx:1.27-alpine</code>?</summary>

The name, `nginx`, which says which program; and the tag, `1.27-alpine`, after the colon, which says which version.
</details>

<details>
<summary>5. A check fails when you submit. What now?</summary>

Read the check's hint, look at the cluster again, fix what it points at, and submit again. You can submit as often as you like.
</details>

## Clean up

Each lab is a whole Kubernetes cluster running on your computer. When you are done, make sure none is left running.

First, see what is still running:

```sh
astrona list
```

If the list still shows the mission, remove it:

```sh
astrona destroy ATS000/section-010/module-01/lab-01
```

You can also remove a lab by the name `astrona list` shows, for example `astrona destroy ats-000-lab-010-01`. Run `astrona list` once more to check that nothing is left.

You can start the mission again at any time with `astrona run`. It always starts clean, so nothing you changed carries over.

> *Start, look, fix, submit, clean up. Every mission from here on is the same loop, with a harder problem in the middle.*
