# Summary

Well flown, astronaut. You can now tell three kinds of stuck ship apart and know where to look for each. Check yourself, then clean up.

## What you learned

**From [Pending Ships: No Room On The Launch Pad](./course-01-pending-ships-no-room-on-the-launch-pad.md):**

- The scheduler picks a node for each new pod. It only picks a node where the pod's resource request fits.
- A pod that no node can take stays `Pending`, with `0` restarts. The Events show a `FailedScheduling` event and the reason, for example `Insufficient memory`.
- A pending pod has no log. Fix the request in the Deployment, for example with `kubectl set resources deployment/<name> --requests=memory=64Mi`.

**From [Crashing Ships And Their Logs](./course-02-crashing-ships-and-their-logs.md):**

- `CrashLoopBackOff` means the container starts, stops and is restarted with longer waits. `RESTARTS` grows.
- `kubectl logs <pod>` shows what the container printed. `--previous` shows the run before the latest one.
- `kubectl describe pod` shows the exit code under `Last State: Terminated`. `0` is a clean stop, anything else is a failure.
- Fix the cause in the Deployment, with `kubectl edit` or `kubectl patch`. Deleting the pod does not help.

## Your mission

You proved these moves in a graded mission, right after the part that taught them:

| Mission | After the part | What you proved |
| --- | --- | --- |
| [Rescue Two Stuck Ships](./labs/lab-01/README.md) | Crashing Ships And Their Logs | find a Pending pod and a crash loop, fix both Deployments and get a passing grade |

If you skipped it, go back to it now.

## Check yourself

Try to answer each question before you open the answer.

<details>
<summary>1. A pod is <code>Pending</code> with <code>0</code> restarts. Where do you look first?</summary>

At the Events at the bottom of <code>kubectl describe pod</code>. A <code>FailedScheduling</code> event says why no node could take the pod.
</details>

<details>
<summary>2. Why does <code>kubectl logs</code> show nothing useful for a Pending pod?</summary>

The container never started, so it never wrote a log.
</details>

<details>
<summary>3. A pod shows <code>CrashLoopBackOff</code>. What are the two first things to read?</summary>

The log with <code>kubectl logs</code> (add <code>--previous</code> for the run before), and the exit code in <code>kubectl describe pod</code>.
</details>

<details>
<summary>4. How is <code>Pending</code> different from <code>ImagePullBackOff</code>?</summary>

With <code>Pending</code>, no node was found for the pod. With <code>ImagePullBackOff</code>, a node was found, but the kubelet could not pull the image.
</details>

## Clean up

Each lab and each playground is a whole Kubernetes cluster running on your computer. See what is still running:

```sh
astrona list
```

If the list still shows the mission, remove it:

```sh
astrona destroy ATS000/section-020/module-02/lab-01
```

Then remove your playground by its name:

```sh
astrona destroy ats-000-playground-020-02
```

> *Pending: no room. ImagePullBackOff: no blueprint. CrashLoopBackOff: the ship will not stay up.*

<!-- astrona:playground:destroy -->
