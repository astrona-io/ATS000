# Case study: a release that never took off

The `engine` fleet was updated last night. The new release cannot start, so the old ships still fly while the new ones are stuck. You must go back to the last good release.

## Things worth knowing before you start

- `kubectl rollout history deployment/engine -n release-lab` lists the revisions.
- `kubectl rollout undo deployment/engine -n release-lab` returns to the previous revision.
- A revision is the whole pod template: the image and the environment together.
- `kubectl rollout status` waits and reports when a rollout is finished.

## What to do

Look at the stuck rollout, undo it, and confirm that the old image and the old value are back. Then submit.
