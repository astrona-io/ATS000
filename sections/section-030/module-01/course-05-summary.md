# Summary

Well flown, astronaut. The terminal is now a console you can read. Check yourself, then clean up.

## What you learned

**From [Where You Are: Paths And Folders](./course-01-where-you-are-paths-and-folders.md):**

- `pwd` prints the current folder, `ls` lists it and `cd` moves. `..` is the folder above, `~` is home.
- An absolute path starts with `/`. A relative path starts from the current folder.

**From [Make, Read And Move Files](./course-02-make-read-and-move-files.md):**

- `echo "text" > file` writes a file, `>>` adds to it, and `cat`, `head`, `tail` and `less` read it.
- `cp` copies, `mv` moves or renames, and `rm` removes for good.

**From [Pipes And Filters](./course-03-pipes-and-filters.md):**

- A pipe sends the output of one command to another. `grep` filters lines and `wc -l` counts them.
- `kubectl get ... | grep ...` finds the rows you care about in a long roll call.

**From [Variables And Editing](./course-04-variables-and-editing.md):**

- `NAME=value` sets a variable and `$NAME` reads it. `$(...)` keeps the result of a command.
- `nano` edits a file, and `Ctrl+R` searches your history.

## Your mission

You proved these moves in a graded mission, right after the part that taught them:

| Mission | After the part | What you proved |
| --- | --- | --- |
| [Find The Silent Ships](./labs/lab-01/README.md) | Variables And Editing | read a roll call with a pipe, find two silent fleets, fix both and get a passing grade |

If you skipped it, go back to it now.

## Check yourself

Try to answer each question before you open the answer.

<details>
<summary>1. You type <code>cd notes</code> and the terminal says it cannot find the folder. What is the first command to run?</summary>

<code>pwd</code>, and then <code>ls</code>. A relative path starts from the current folder, so you may be standing in the wrong place.
</details>

<details>
<summary>2. What is the difference between <code>&gt;</code> and <code>&gt;&gt;</code>?</summary>

<code>&gt;</code> replaces the file. <code>&gt;&gt;</code> adds to the end of the file.
</details>

<details>
<summary>3. What does <code>kubectl get deployments -n terminal-lab | grep 0/</code> show?</summary>

Only the rows that contain <code>0/</code>, for example a Deployment with no ready ship.
</details>

<details>
<summary>4. How do you keep a planet name in a variable and use it?</summary>

Set it with <code>NS=terminal-lab</code> (no spaces) and read it with <code>$NS</code>, for example <code>kubectl get pods -n $NS</code>.
</details>

## Clean up

Each lab and each playground is a whole Kubernetes cluster running on your computer. See what is still running:

```sh
astrona list
```

If the list still shows the mission, remove it:

```sh
astrona destroy ATS000/section-030/module-01/lab-01
```

Then remove your playground by its name:

```sh
astrona destroy ats-000-playground-030-01
```

> *Know where you stand, read before you remove, filter with a pipe, and keep names in variables.*

<!-- astrona:playground:destroy -->
