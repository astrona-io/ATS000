# Check A File Before You Launch It

You do not have to launch a file to find out if it is good. `kubectl` can read a file and tell you what is wrong, without changing anything. This part shows three checks and how to read the errors.

## Check without changing anything

A **dry run** asks `kubectl` to read the file and act as if it applied it, without doing it. Think of it as a simulator run: the ship never leaves the dock.

### Run a dry run

Save the Deployment from the previous part as `deployment-signal.yaml` if you have not. Then:

```sh
kubectl apply --dry-run=client -f deployment-signal.yaml
```

A good file prints a line that says the Deployment was created, followed by the words `(dry run)`. Nothing is created. The word `client` means `kubectl` checks the file on your own computer. The form `--dry-run=server` also asks the cluster, which catches more mistakes, for example a field that does not exist.

### Read an error

Break the file on purpose. Change `replicas: 2` to `replicas: two`, and run the dry run again:

```sh
kubectl apply --dry-run=server -f deployment-signal.yaml
```

The cluster answers with an error that names the field, `spec.replicas`, and says that it expected a number. Now undo that change, and break the indentation instead: move the line `image:` one space to the left. The first line of the error names the line number and ends with a message such as `mapping values are not allowed in this context` or `did not find expected key`. Go to that line number, and the line above it.

> [!TIP]
> Read the line number in the error first, then look at that line and the one above. A YAML mistake is often in the line before the one named.

## Look up a field

You do not need to remember every field. `kubectl explain` prints the manual for a field, straight from the cluster you talk to.

### Ask the manual

```sh
kubectl explain deployment.spec.replicas
kubectl explain deployment.spec.template.spec.containers.ports
```

Each answer shows the field, the kind of value it holds and a short description. Add `--recursive` to see every field under it as a tree.

## A habit for every file

Follow the same four steps for every file. Write the file, dry run it, apply it, check the result:

```sh
kubectl apply --dry-run=client -f deployment-signal.yaml
kubectl apply -f deployment-signal.yaml
kubectl get deployment signal -n draft-lab
kubectl delete -f deployment-signal.yaml
```

The last line removes what the file made. `kubectl delete -f` is the mirror of `kubectl apply -f`.

## Common pitfalls

> [!WARNING]
> - **Trusting a dry run with `client` for every mistake.** It misses fields the cluster does not know. Use `--dry-run=server` when you can.
> - **Fixing the wrong line.** Read the line before the one the error names.
> - **Editing the printed object.** Write your own file from the four parts instead.
> - **Forgetting to save in the editor.** The dry run reads the file on disk.
> - **Applying a file twice.** `kubectl apply` is safe to repeat. It says `unchanged` when nothing differs.

> *Write, dry run, apply, check. Ask `kubectl explain` when you forget a field.*

## Your mission: Write The Radar Fleet Order

You can now read and write a fleet order and check it before launch. Your mission: on the empty planet `yaml-lab`, write a Deployment called `radar` from nothing, and apply it.

Pause the playground first, so the lab has the memory it needs:

```sh
astrona stop ats-000-playground-030-02
```

Start the mission:

```sh
astrona run ATS000/section-030/module-02/lab-01
```

Read the task in [`question.md`](./labs/lab-01/question.md) and solve it on your own first, in a lab shell (`astrona shell`). When you think you are done, leave the lab shell and send it for grading:

```sh
astrona submit ATS000/section-030/module-02/lab-01
```

When the mission is done, remove the lab and start the playground again:

```sh
astrona destroy ats-000-lab-030-02-01
astrona start ats-000-playground-030-02
```
