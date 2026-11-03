# Summary

Well flown, astronaut. You can now change a fleet, find ships by their stickers, and launch a fleet from a file. Check yourself, then clean up.

## What you learned

**From [Scale And Label The Fleet](./course-01-scale-and-label-the-fleet.md):**

- `kubectl scale deployment/<name> --replicas=<n>` changes the number of ships. The Deployment controller builds or removes pods to match.
- In `kubectl get deployment`, `READY 1/3` means one pod is ready and three are asked for.
- A label is a `key=value` sticker. `--show-labels` shows them, `-l key=value` picks by them, and `kubectl label` adds or removes them.
- A Deployment finds its pods with `spec.selector.matchLabels`, and gives them labels from `spec.template.metadata.labels`. The two must match.

**From [Describe A Fleet In A File](./course-02-describe-a-fleet-in-a-file.md):**

- A Deployment file has `apiVersion`, `kind`, `metadata` and `spec`. The pod design is in `spec.template`.
- `kubectl apply -f <file>` creates what is missing and changes what differs. Apply the same file again after an edit.
- A Service is a stable call sign. It picks pods with a selector, and `kubectl get endpoints` shows which pods it found. `<none>` means no match.

## Your mission

You proved these moves in a graded mission, right after the part that taught them:

| Mission | After the part | What you proved |
| --- | --- | --- |
| [Launch A Fleet From A File](./labs/lab-01/README.md) | Describe A Fleet In A File | write a Deployment and a Service in files, apply them and get a passing grade |

If you skipped it, go back to it now.

## Check yourself

Try to answer each question before you open the answer.

<details>
<summary>1. A Deployment shows <code>READY 1/3</code>. What does it mean?</summary>

One pod is ready, and the fleet order asks for three. Wait, or look at the pods that are not ready.
</details>

<details>
<summary>2. How does a Deployment know which pods are its own?</summary>

By labels. Its <code>spec.selector.matchLabels</code> says which labels its pods have, and its pod template gives those labels to every pod it builds.
</details>

<details>
<summary>3. You applied a Service and <code>kubectl get endpoints</code> shows <code>&lt;none&gt;</code>. Where do you look?</summary>

At the Service's selector and at the pods' labels. The Service finds no ready pod that carries all the labels in its selector.
</details>

<details>
<summary>4. You edited a Deployment file but the cluster did not change. Why?</summary>

The cluster only changes when you give it the file. Run <code>kubectl apply -f</code> on the file again.
</details>

## Clean up

Each lab and each playground is a whole Kubernetes cluster running on your computer. See what is still running:

```sh
astrona list
```

If the list still shows the mission, remove it:

```sh
astrona destroy ATS000/section-020/module-01/lab-01
```

Then remove your playground by its name:

```sh
astrona destroy ats-000-playground-020-01
```

> *Scale with a number, find with a label, launch from a file.*

<!-- astrona:playground:destroy -->
