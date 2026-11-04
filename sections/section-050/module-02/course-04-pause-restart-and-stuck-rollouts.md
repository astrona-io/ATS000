# Pause, Restart And Stuck Rollouts

Three more controls complete your toolbox: pause, resume and restart. And one skill: recognising a rollout that will not finish.

## Batch several changes

Each change starts a rollout. To make several changes as one release, pause first.

### Pause and resume

```sh
kubectl rollout pause deployment/shuttle -n rollout-lab
kubectl set image deployment/shuttle web=nginx:1.27-alpine -n rollout-lab
kubectl set env deployment/shuttle RELEASE=three -n rollout-lab
kubectl rollout resume deployment/shuttle -n rollout-lab
```

While paused, changes are collected. After `resume`, they roll out as one release.

## Restart

```sh
kubectl rollout restart deployment/shuttle -n rollout-lab
```

This replaces every pod with a new one, without a change in the file. Use it after you changed a ConfigMap and want the pods to read the new environment values.

## A stuck rollout

A rollout is stuck when new pods never get ready.

### Recognise it

```sh
kubectl rollout status deployment/shuttle -n rollout-lab --timeout=60s
kubectl get pods -n rollout-lab
kubectl describe deployment shuttle -n rollout-lab
```

Signs: the status command times out, you see old and new pods side by side, and new pods show `ImagePullBackOff` or `Pending`. Read the pod's events for the cause, then either fix the cause or roll back.

## Your mission: Undo The Bad Release

Pause the playground, then start the mission:

```sh
astrona stop ats-000-playground-050-02
astrona run ATS000/section-050/module-02/lab-01
```

Read the task in [`question.md`](./labs/lab-01/question.md), work in `astrona shell`, then submit. When it passes:

```sh
astrona destroy ats-000-lab-050-02-01
astrona start ats-000-playground-050-02
```

## Common pitfalls

> [!WARNING]
> - **Forgetting to resume.** A paused Deployment never rolls out.
> - **Restarting to fix a bad image.** A restart uses the same template.
> - **Rolling back a paused Deployment.** Resume it first.
> - **Waiting without a timeout.** Add `--timeout`.
> - **Ignoring the old pods.** They are the proof that service continues.

> *Pause to batch, restart to refresh, and read the pods when a rollout will not finish.*
