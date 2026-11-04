# When The Settings Are Missing

If a pod refers to a ConfigMap or Secret that does not exist, it does not start. The status tells you.

## Read the signs

Look at the pod first.

### The status

```sh
kubectl get pods -n vault-lab
```

A pod that cannot get its settings shows `CreateContainerConfigError`. The container was never created.

### The reason

```sh
kubectl describe pod <pod-name> -n vault-lab
```

Replace `<pod-name>` with the pod's name. In the `Events` section, a line says that a ConfigMap or a Secret with a given name was not found, or that a key was not found in it. The name is in the message.

## Fix it

Make the missing object, with the exact name and key that the message gives.

### Before and after

Before: the message names a ConfigMap `gate-config` and the pod waits. After you create it:

```sh
kubectl create configmap gate-config --from-literal=GREETING=hello -n vault-lab
```

the pod starts by itself on its next retry. You do not have to restart it, which is why you must not edit the Deployment unless the reference is wrong.

## Your mission: Give The Gate Its Settings

Pause the playground, then start the mission:

```sh
astrona stop ats-000-playground-050-01
astrona run ATS000/section-050/module-01/lab-01
```

Read the task in [`question.md`](./labs/lab-01/question.md), work in `astrona shell`, then submit. When it passes:

```sh
astrona destroy ats-000-lab-050-01-01
astrona start ats-000-playground-050-01
```

## Common pitfalls

> [!WARNING]
> - **Creating the object in the wrong namespace.** Use `-n`.
> - **A name with a typo.** Copy it from the event.
> - **Right object, wrong key.** The key must match exactly.
> - **Waiting without reading.** `describe` names the missing object.
> - **Editing the Deployment when the reference is right.** Create the missing object instead.

> *A pod that will not start is asking for something. Read what it asks for.*
