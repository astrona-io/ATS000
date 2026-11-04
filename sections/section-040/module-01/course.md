# The Astrona Workflow

Astronaut, every mission in this program follows the same loop: start a lab, work in it, send it for grading, read the feedback, and clean up. The `astrona` command runs that loop. This module teaches each step, so no lab surprises you.

## Learning objectives

After this module you can:

- Sign in, check who you are, and find a lab in the catalog.
- Start a lab or playground with `astrona run` and open a shell inside it.
- Read the task with `astrona docs question` and the other docs commands.
- Stop, start and switch between environments with `astrona stop`, `astrona start` and `astrona use`.
- Send work for grading with `astrona submit`, and read the failed checks and their hints.
- Use `--history`, `--no-hints` and `--watch`, and see your results with `astrona progress`.
- Start over with `astrona reset`, and remove environments with `astrona destroy`.

## Before you start

You should have the `astrona` command installed and be comfortable in the terminal. The commands in this module are real; run `astrona --help` or `astrona <command> --help` to see every option on your own version.

Your playground is the planet `training-lab`, with two Deployments: `probe`, which is healthy, and `drift`, which has a misspelled image tag. Launch it now and keep it running:

<!-- astrona:playground -->

## The parts of this module

Read the parts in this order. Each one takes about 10 minutes.

| Part | What you learn |
| --- | --- |
| [Sign In, Find A Lab And Run It](./course-01-sign-in-find-a-lab-and-run-it.md) | `setup`, `login`, `whoami`, `labs`, `run` |
| [Inside A Lab: Shell, Docs And Switching](./course-02-inside-a-lab-shell-docs-and-switching.md) | `shell`, `docs`, `use`, `stop`, `start`, `status` |
| [Submit And Read The Hints](./course-03-submit-and-read-the-hints.md) | `submit`, failed checks, hints, `--history`, `--no-hints`, `--watch`, `progress` |
| [Start Over And Clean Up](./course-04-start-over-and-clean-up.md) | `reset`, `destroy`, `list`; then your graded mission |
| [Summary: The Mission Loop](./course-05-summary.md) | What you learned, a short self-check and cleaning up |

## Why this matters

A learner who knows the loop never loses time on the tool. When a check fails, you read the hint instead of guessing, and when a lab is broken beyond repair, you reset it instead of fighting it.
