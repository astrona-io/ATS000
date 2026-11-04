# Summary

Well flown, astronaut. You have a method now. Check yourself, then clean up.

## What you learned

**From [The Four-Step Method](./course-01-the-four-step-method.md):**

- Look, narrow, read the clue, make the smallest fix, then look again.

**From [Read The Pod Status](./course-02-read-the-pod-status.md):**

- `ImagePullBackOff`, `Pending`, `CrashLoopBackOff` and `CreateContainerConfigError` each point to a place to look.

**From [Services And Endpoints](./course-03-services-and-endpoints.md):**

- A Service finds pods with a selector. Empty endpoints mean the selector, the port or the readiness is wrong.

**From [Notes And Habits](./course-04-notes-and-habits.md):**

- Write the cause, change one thing and verify with the same command.

## Your mission

| Mission | After the part | What you proved |
| --- | --- | --- |
| [The Beacon That Reaches No One](./labs/lab-01/README.md) | Services And Endpoints | find why a Service has no endpoints, fix it and pass every check |

If you skipped it, go back to it now.

## Check yourself

<details>
<summary>1. What are the four steps?</summary>

Look, narrow, read the clue and make the smallest fix. Then look again.
</details>

<details>
<summary>2. Which status points to a missing ConfigMap?</summary>

<code>CreateContainerConfigError</code>.
</details>

<details>
<summary>3. A Service has empty endpoints. What do you compare?</summary>

The Service selector and the pod labels. Also check the target port and pod readiness.
</details>

<details>
<summary>4. Why not delete a broken pod?</summary>

Its Deployment makes the same pod again, with the same fault.
</details>

## Clean up

```sh
astrona list
astrona destroy ats-000-lab-060-01-01
astrona destroy ats-000-playground-060-01
```

Skip the first destroy if the list does not show the mission.

> *Read the clue before you touch anything.*

<!-- astrona:playground:destroy -->
