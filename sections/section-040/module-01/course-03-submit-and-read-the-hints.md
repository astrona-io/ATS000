# Submit And Read The Hints

`astrona submit` sends your cluster to the Proctor for grading. The grader runs its checks and tells you what passed, what failed, and how to find the mistake.

## Send work for grading

A submit does not end the lab. You can submit as often as you like, so use it as a feedback tool.

### Your first submit

```sh
astrona submit
```

Run it from your own terminal, not from inside the lab shell. Give the lab name when you have more than one environment: `astrona submit ATS000/section-040/module-01/lab-01`.

### Read the result

The result lists each check with a pass or a fail. For a failed check you also see a **hint**, a short line that tells you where to look. It does not give the answer. Read it, change one thing, and submit again.

Typical flow: the first submit shows three failed checks. You fix the first one. The next submit shows two failed checks. You fix the next. Keep going until every check passes.

## Options that help

Three flags change what you see.

### History

```sh
astrona submit --history
```

Shows your earlier results, so you can see how you got closer.

### No hints

```sh
astrona submit --no-hints
```

Hides the hints. Use it when you want to test yourself like in a real exam.

### Watch

```sh
astrona submit --watch
```

Keeps grading until you stop it, so you can fix something in another terminal and see the result change.

> [!TIP]
> Submit early, before you think you are done. A failed check is cheap, and its hint saves you time.

## Your progress

```sh
astrona progress
```

shows which labs you have finished and which you have started. Use it to see what is left in a course.

## Common pitfalls

> [!WARNING]
> - **Submitting from inside the lab shell.** Leave it with `exit` first.
> - **Ignoring the hint.** It names the resource or field to look at.
> - **Fixing the pods.** Pods belong to a Deployment. Change the Deployment.
> - **Changing five things at once.** Change one thing, then submit.
> - **Fixing something the check does not test.** Read each check name closely.

> *Submit early, read the hint, change one thing, and submit again.*
