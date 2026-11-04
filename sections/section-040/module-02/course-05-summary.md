# Summary

Well flown, astronaut. Your radio is tuned. Check yourself, then clean up.

## What you learned

**From [Planets And Namespaces](./course-01-planets-and-namespaces.md):**

- `kubectl get namespaces` lists planets. `-n` picks one and `-A` takes all.
- An empty list often means the wrong namespace.

**From [Shape The Output With -o](./course-02-shape-the-output-with-o.md):**

- `-o wide`, `-o name`, `-o yaml` and `-o jsonpath` change the shape.
- `--show-labels` and `-l` show and filter by labels.

**From [Describe, Events And Logs](./course-03-describe-events-and-logs.md):**

- `describe` explains an object. `get events` shows what happened. `logs` shows the program's output.
- `--previous` shows the log of the last finished run.

**From [Exec And Port-Forward](./course-04-exec-and-port-forward.md):**

- `kubectl exec ... -- command` runs a command inside a pod.
- `kubectl port-forward service/name 8080:80` opens a local door to a Service.

## Your mission

| Mission | After the part | What you proved |
| --- | --- | --- |
| [Write A Note Inside A Ship](./labs/lab-01/README.md) | Exec And Port-Forward | find a planet with `-A`, write a file with `exec`, and pass every check |

If you skipped it, go back to it now.

## Check yourself

<details>
<summary>1. A <code>kubectl get</code> prints nothing. What do you check first?</summary>

The namespace. Add <code>-n</code> or try <code>-A</code>.
</details>

<details>
<summary>2. Which flag prints one field of an object?</summary>

<code>-o jsonpath='{.spec.replicas}'</code>, with the path of your field.
</details>

<details>
<summary>3. How do you read the log of the run before the restart?</summary>

<code>kubectl logs &lt;pod&gt; --previous</code>.
</details>

<details>
<summary>4. Why is there a <code>--</code> in <code>kubectl exec</code>?</summary>

It separates <code>kubectl</code>'s own flags from the command that runs inside the pod.
</details>

## Clean up

```sh
astrona list
astrona destroy ats-000-lab-040-02-01
astrona destroy ats-000-playground-040-02
```

Skip the first destroy if the list does not show the mission.

> *Look at the planet, shape the output, read the story, then go in.*

<!-- astrona:playground:destroy -->
