# Summary

Well flown, astronaut. You know the whole mission loop now. Check yourself, then clean up.

## What you learned

**From [Sign In, Find A Lab And Run It](./course-01-sign-in-find-a-lab-and-run-it.md):**

- `astrona setup` checks your tools, `astrona login` signs you in and `astrona whoami` shows who you are.
- `astrona labs` lists the catalog and `astrona run <lab>` builds the cluster.

**From [Inside A Lab: Shell, Docs And Switching](./course-02-inside-a-lab-shell-docs-and-switching.md):**

- `astrona shell` opens a terminal pointed at the lab. `astrona docs question` prints the task.
- `astrona list`, `status`, `use`, `stop` and `start` manage several environments.

**From [Submit And Read The Hints](./course-03-submit-and-read-the-hints.md):**

- `astrona submit` grades your work. Failed checks show a hint.
- `--history`, `--no-hints` and `--watch` change the output. `astrona progress` shows what you finished.

**From [Start Over And Clean Up](./course-04-start-over-and-clean-up.md):**

- `astrona reset --soft` restores the lab objects. `astrona reset` builds the lab again.
- `astrona destroy <name>` removes an environment. Find the name with `astrona list`.

## Your mission

| Mission | After the part | What you proved |
| --- | --- | --- |
| [Read The Examiner's Hints](./labs/lab-01/README.md) | Start Over And Clean Up | submit, read the failed checks, fix the Deployments and pass every check |

If you skipped it, go back to it now.

## Check yourself

<details>
<summary>1. Where do you run <code>astrona submit</code>: inside the lab shell or outside?</summary>

Outside. Leave the lab shell with <code>exit</code> first.
</details>

<details>
<summary>2. What is a hint?</summary>

A short line next to a failed check that tells you where to look. It does not give the answer.
</details>

<details>
<summary>3. When do you use <code>astrona reset --soft</code>?</summary>

When you broke the objects in the lab and want the first state back without building a new cluster.
</details>

<details>
<summary>4. How do you remove an environment?</summary>

Find its name with <code>astrona list</code>, then run <code>astrona destroy &lt;name&gt;</code>.
</details>

## Clean up

See what is still running:

```sh
astrona list
```

If the mission is still there, remove it:

```sh
astrona destroy ats-000-lab-040-01-01
```

Then remove your playground by its name:

```sh
astrona destroy ats-000-playground-040-01
```

> *Run, work, submit, read the hint, repeat, destroy.*

<!-- astrona:playground:destroy -->
