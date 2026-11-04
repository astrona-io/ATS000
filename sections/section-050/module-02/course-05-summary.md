# Summary

Well flown, astronaut. Releases are routine now. Check yourself, then clean up.

## What you learned

**From [How A Rollout Works](./course-01-how-a-rollout-works.md):**

- A Deployment owns ReplicaSets, which own pods. A pod template change starts a rollout.

**From [Change A Release And Watch It](./course-02-change-a-release-and-watch-it.md):**

- `kubectl set image`, `kubectl set env`, `kubectl rollout status` and `kubectl rollout history`.

**From [Undo A Bad Release](./course-03-undo-a-bad-release.md):**

- `kubectl rollout undo` returns the whole old template. `--to-revision` picks a revision.

**From [Pause, Restart And Stuck Rollouts](./course-04-pause-restart-and-stuck-rollouts.md):**

- `pause` and `resume` batch changes. `restart` replaces all pods. A stuck rollout shows old and new pods side by side.

## Your mission

| Mission | After the part | What you proved |
| --- | --- | --- |
| [Undo The Bad Release](./labs/lab-01/README.md) | Pause, Restart And Stuck Rollouts | find a stuck release, undo it and pass every check |

If you skipped it, go back to it now.

## Check yourself

<details>
<summary>1. Does changing <code>replicas</code> create a new revision?</summary>

No. Only a pod template change does.
</details>

<details>
<summary>2. Why can <code>rollout undo</code> be better than setting the image again?</summary>

It returns the whole old template, including fields other than the image.
</details>

<details>
<summary>3. A rollout does not finish. Are users down?</summary>

Usually not. The old pods keep running until the new ones are ready.
</details>

<details>
<summary>4. How do you make three changes as one release?</summary>

Run <code>kubectl rollout pause</code>, make the changes, then <code>kubectl rollout resume</code>.
</details>

## Clean up

```sh
astrona list
astrona destroy ats-000-lab-050-02-01
astrona destroy ats-000-playground-050-02
```

Skip the first destroy if the list does not show the mission.

> *Watch it, read the history, and roll back the whole template.*

<!-- astrona:playground:destroy -->
