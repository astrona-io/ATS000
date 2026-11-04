# Case study: one broken lamp and one missing gauge

The planet `deck-lab` has a lamp that does not light and no gauge at all. You find the fault with a roll call, and you write the missing fleet order yourself.

## Things worth knowing before you start

- Pipe a roll call into `grep` to keep only the lines you care about.
- The `READY` column shows ships in flight over ships asked for.
- A new fleet order goes in a file. Check it with `kubectl apply --dry-run=client -f <file>` before you apply it.
- The selector must match the pod labels. Extra pod labels are fine.

## What to do

Fix `lamp`, write `gauge`, check both with a roll call and submit.
