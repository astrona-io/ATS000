# Case study: two ships that never settled

Two services on the planet `rescue-lab` have not run since a change last week. One never gets a pod that runs at all. The other starts and dies at once.

## Things worth knowing before you start

- A pod that is `Pending` has no node yet. Its Events say why. A pod that is `CrashLoopBackOff` started and stopped, so it has a log.
- The `RESTARTS` column tells the two apart: `Pending` pods have `0`, a crash loop has a growing number.
- `kubectl describe pod <name> -n rescue-lab` shows the Events. `kubectl logs <name> -n rescue-lab` shows the log.
- A container's `resources.requests.memory` says how much memory it reserves. A `command` in the container replaces the image's own start command.
- Fix the Deployment, not the pods: `kubectl set resources`, `kubectl edit` or `kubectl patch`.

## What to do

Look at both pods, read the right place for each one, and fix both Deployments. Then submit.
