# Undo A Bad Release

When a release goes wrong, the fastest way back is `rollout undo`. It does not rebuild anything. It points the Deployment at an older ReplicaSet that Kubernetes still remembers.

## Roll back

### To the last revision

```sh
kubectl set image deployment/shuttle web=nginx:does-not-exist -n rollout-lab
kubectl rollout status deployment/shuttle -n rollout-lab --timeout=30s
kubectl rollout undo deployment/shuttle -n rollout-lab
kubectl rollout status deployment/shuttle -n rollout-lab
```

The first call starts a bad release, the second times out because the new pods cannot start, the third goes back to the revision before, and the fourth confirms. Notice that the old pods were running all the time, because Kubernetes keeps them until the new ones are ready.

### To a given revision

```sh
kubectl rollout history deployment/shuttle -n rollout-lab
kubectl rollout undo deployment/shuttle -n rollout-lab --to-revision=1
```

Choose the number from the history.

## Undo is not the same as fixing the image

You could also repair the release by setting a good image again. That works only if you know the good image. A rollback returns the **whole old template**: the image and also every other field, such as a variable. If the bad release changed more than the image, only a rollback puts everything back.

### How the lab checks

The mission in this module changes two things in the release. Setting only the image back would leave the other field wrong, so look at the history before you decide.

## Common pitfalls

> [!WARNING]
> - **Fixing only the image.** Other fields may still be wrong. Prefer `rollout undo`.
> - **Undoing twice.** A second `undo` goes back to the bad release, because the last revision is now the good one.
> - **Using a history that was cleaned.** Only a limited number of old revisions is kept.
> - **Rolling back without finding the cause.** The next release breaks again.
> - **Forgetting `-n`.** You roll back the wrong planet, or nothing.

> *A rollback returns the whole old template, not just the image.*
