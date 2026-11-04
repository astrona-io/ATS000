# The Four-Step Method

Four steps cover almost every fault. Do them in order, and do not skip to a fix.

## The steps

Each step has one question and one command.

| Step | Question | Command |
| --- | --- | --- |
| 1. Look | What is the state? | `kubectl get pods -n <ns>` |
| 2. Narrow | Which object is wrong? | `kubectl get deployments,services -n <ns>` |
| 3. Read the clue | What does the cluster say? | `kubectl describe`, `kubectl logs`, `kubectl get events` |
| 4. Smallest fix | What is the one change? | `kubectl edit`, `set image`, `apply` |

### Step 1 and 2: look and narrow

```sh
kubectl get pods -n clinic-lab
kubectl get deployments,services -n clinic-lab
```

Read the STATUS and READY columns. One pod at a time, say what you see in plain words: "this pod cannot pull its image".

### Step 3: read the clue

```sh
kubectl describe pod <pod-name> -n clinic-lab
kubectl logs <pod-name> -n clinic-lab
kubectl get events -n clinic-lab --sort-by=.lastTimestamp
```

Use `describe` for a pod that did not start, and `logs` for one that started and then fell over.

### Step 4: smallest fix

Fix the cause, not the symptom. Fix the Deployment, not the pod, because the Deployment would replace the pod anyway.

## Verify

After the fix, run step 1 again. A fault is fixed only when the status shows it.

## Common pitfalls

> [!WARNING]
> - **Fixing before reading.** You may fix the wrong thing.
> - **Changing several things at once.** You will not know which one worked.
> - **Editing a pod.** Edit its Deployment.
> - **Stopping at the first error.** There can be two faults.
> - **Skipping the verify step.** Run `get pods` again.

> *Look, narrow, read, fix the smallest thing, then look again.*
