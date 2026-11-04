# Change A Release And Watch It

You can change a Deployment by editing its file and applying it, or by a direct command. For small changes the commands are quick.

## Change something

Both calls below change the pod template, so both start a rollout.

### Change the image

```sh
kubectl set image deployment/shuttle web=nginx:1.26-alpine -n rollout-lab
```

The form is `container-name=image`. Check the real container name first with `kubectl get deployment shuttle -n rollout-lab -o jsonpath='{.spec.template.spec.containers[*].name}'`.

### Change a variable

```sh
kubectl set env deployment/shuttle RELEASE=two -n rollout-lab
```

## Watch it

### Follow the rollout

```sh
kubectl rollout status deployment/shuttle -n rollout-lab
```

The command waits and prints progress. It ends when the rollout is done. If the new pods never become ready, it keeps waiting. Stop it with Ctrl+C and look at the pods.

### Read the history

```sh
kubectl rollout history deployment/shuttle -n rollout-lab
```

Each line is a revision. To see what one contained, ask for it:

```sh
kubectl rollout history deployment/shuttle -n rollout-lab --revision=2
```

The CHANGE-CAUSE column is empty unless you add the annotation `kubernetes.io/change-cause` to the Deployment. Add a note when you want to remember why you changed something.

## Common pitfalls

> [!WARNING]
> - **A wrong container name in `set image`.** The command fails.
> - **A bad image tag.** The rollout stalls with `ImagePullBackOff` pods.
> - **Waiting forever on `rollout status`.** Use Ctrl+C, then `get pods`.
> - **Reading an empty CHANGE-CAUSE as an error.** It is just unset.
> - **Changing the file and the live object at once.** The next `apply` overwrites one of them.

> *Change one thing, watch the rollout, and read the history.*
