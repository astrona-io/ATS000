# Case study: two fleets, two typos

Two teams deployed a small web app each and went home. The `scout` app in `dock` and the `cargo` app in `hangar` have been down since. Both teams swear the apps are fine.

## Things worth knowing before you start

- A **namespace** is a planet. Add `-n dock` or `-n hangar` to every `kubectl` command, so you look at the right one.
- `kubectl get pods -n <namespace>` is the roll call. Anything other than `Running` is a clue.
- `kubectl describe pod <name> -n <namespace>` shows the Events at the bottom: mission control's log book.
- An image name has a name and a tag, `name:tag`. A typo in either one stops the launch.
- The fix goes in the Deployment: `kubectl set image deployment/<name> <container>=<image> -n <namespace>`.

## What to do

Look at both planets. Do not assume the two mistakes are the same: read the event on each one. Fix the two Deployments, keep the replica counts, and submit.
