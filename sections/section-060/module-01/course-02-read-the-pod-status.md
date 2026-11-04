# Read The Pod Status

The STATUS column is a clue by itself. Learn the common ones, and you know where to look next.

## The status table

| Status | Usual meaning | Where to look |
| --- | --- | --- |
| `ImagePullBackOff` or `ErrImagePull` | The image name or tag is wrong | `describe pod`, Events |
| `Pending` | No node can take the pod, often not enough memory | `describe pod`, Events |
| `CrashLoopBackOff` | The program starts and exits again and again | `logs`, `logs --previous` |
| `CreateContainerConfigError` | A ConfigMap or Secret is missing | `describe pod`, Events |
| `Running` but `0/1` ready | The program runs but fails its readiness check | `describe pod`, `logs` |

### Try each one

```sh
kubectl get pods -n clinic-lab
kubectl describe pod <wrong-tag-pod> -n clinic-lab
kubectl logs <quitter-pod> -n clinic-lab --previous
```

Use real pod names from the list. For the `wrong-tag` Deployment, the event names the image that could not be pulled. For `quitter`, the previous log shows what the program said before it left. For `too-big`, the event says why the scheduler could not place it, for example a memory request larger than any node has.

## Pick the smallest fix

| Fault | Smallest fix |
| --- | --- |
| Wrong image tag | `kubectl set image deployment/<name> <container>=<good image> -n <ns>` |
| Too much memory requested | Lower the request in the Deployment |
| Missing ConfigMap or Secret | Create it with the exact name and key |
| Crash loop | Fix the command or its setting |

## Common pitfalls

> [!WARNING]
> - **Reading only the STATUS.** Add `describe` for the reason.
> - **Using `logs` on a pod that never started.** There are none.
> - **Confusing `Pending` with a crash.** `Pending` never started.
> - **Deleting the pod to fix it.** The Deployment makes the same pod again.
> - **Raising limits blindly.** Read the event first.

> *The status points to the place, the events give the reason.*
