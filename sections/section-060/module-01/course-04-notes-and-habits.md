# Notes And Habits

A method is only useful if you keep to it. This part collects the habits that make the next fault faster.

## Write the fault down

Before you change anything, write one line: what you see, and what you think the cause is.

### A short log

```text
pod wrong-tag: ImagePullBackOff, event says tag 1.27-alpien not found. Cause: typo in tag.
```

Keep the notes in a file. Then check each line after the fix.

## Habits

### Smallest change first

One change, then look again. If it did not help, undo it before you try the next.

### Save before you edit

Before an edit of a live object, save a copy:

```sh
kubectl get deployment wrong-tag -n clinic-lab -o yaml > wrong-tag-before.yaml
```

### Prefer the file

If you fix a Deployment, fix the file you keep, and apply it. Then your fix is not lost at the next apply.

### Verify with the same command

Use the same command before and after, for example `kubectl get pods -n clinic-lab`. The difference is the proof.

## Practise

Work through all six faults in the playground. For each, write the note, make the smallest fix, and verify.

## Common pitfalls

> [!WARNING]
> - **Not writing the cause.** You will forget it.
> - **Fixing by trial.** Read the event first.
> - **Leaving a failed experiment in place.** Undo it.
> - **Editing live objects only.** Your file will disagree with the cluster.
> - **Declaring victory without a look.** Run `get pods` again.

> *Write the cause, change one thing, verify with the same command.*
