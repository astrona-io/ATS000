# Start Over And Clean Up

Sometimes a lab goes wrong beyond repair. Sometimes you are simply done. This part shows how to start over, and how to leave no clusters behind.

## Start over

A reset puts the lab back in its first state.

### Soft reset

```sh
astrona reset --soft
```

A soft reset keeps the cluster, and puts the objects of the lab back as they were at the start. It is quick. Use it when you broke the lab's objects.

### Full reset

```sh
astrona reset
```

Without the flag, the command builds the lab again. It takes longer, and gives you a clean start. Use it when the cluster itself is in a bad state.

## Clean up

Every lab is a whole cluster on your machine, so clean up when you are done.

### See what is running

```sh
astrona list
```

### Remove what you do not need

```sh
astrona destroy ats-000-playground-040-01
```

`astrona destroy` takes the environment name from `astrona list`, for example `ats-000-lab-040-01-01`. Pass the name, not a folder path.

## Your mission: Read The Examiner's Hints

You can now run a lab, work in it, read the hints and clean up. Your mission: the planet `console-lab` fails inspection. Submit once, read the failed checks and fix the Deployments they point to.

Pause the playground first, so the lab has the memory it needs:

```sh
astrona stop ats-000-playground-040-01
```

Start the mission:

```sh
astrona run ATS000/section-040/module-01/lab-01
```

Read the task in [`question.md`](./labs/lab-01/question.md) and work in a lab shell (`astrona shell`). Submit once at the start to see the hints, fix what they point to, and submit again. When every check passes, clean up:

```sh
astrona destroy ats-000-lab-040-01-01
astrona start ats-000-playground-040-01
```

## Common pitfalls

> [!WARNING]
> - **Destroying the wrong environment.** Read the name in `astrona list` first.
> - **A full reset when a soft one is enough.** Try `--soft` first.
> - **Leaving clusters running.** They use memory until you destroy or stop them.
> - **Passing a path to destroy.** Pass the environment name.
> - **Resetting before you read the hint.** A hint is often a one-line fix.

> *Reset to start over, destroy to leave, and always list before you destroy.*
