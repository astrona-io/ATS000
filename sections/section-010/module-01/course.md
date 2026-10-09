# The Lab Loop: Run, Look, Fix, Submit

Welcome, astronaut. This is your very first mission, and it is a short one. Every Astrona lab works the same way, so the habits you build here carry into every lab after this one.

Every Astrona lab is the same four steps:

1. **Start**: `astrona run <lab>` builds a small Kubernetes cluster on your computer and sets up a problem in it.
2. **Look**: `astrona shell` opens a shell where `kubectl` talks to that cluster. `kubectl get` lists things; `kubectl describe` explains them.
3. **Fix**: change the cluster until it matches the task.
4. **Submit**: `astrona submit <lab>` grades the cluster, check by check, and shows a hint for anything that fails. Keep going and submit again.

When you are done, `astrona destroy <lab>` removes the cluster.

A Kubernetes cluster is a group of computers that run apps for you. Picture it as a solar system. In a lab, the whole solar system runs inside your own computer, like a training solar system in a simulator. The `astrona` command-line tool is the simulator's control desk: it builds the solar system, sets up the problem, and grades your work.

The lab in this module practises exactly that loop on one mistyped image tag.

## Learning objectives

After this module you can:

- Check that your computer is ready for labs with `astrona setup` and `astrona check`.
- Start a lab with `astrona run`, and open a shell for it with `astrona shell`.
- List the pods in a namespace with `kubectl get pods`, and read the `READY` and `STATUS` columns.
- Find out why a pod does not start from the **Events** list of `kubectl describe pod`.
- Explain the two parts of a container image name, the name and the tag.
- Fix a Deployment, not its pods, and watch it replace the pods for you.
- Send your work for grading with `astrona submit`, and remove the lab with `astrona destroy`.

## Before you start

This course assumes almost nothing. If you can open a terminal and type a command, you are ready. A terminal is the cockpit console of your computer: a window where you type orders and read the replies.

### What you should already know

- **How to open a terminal.** On macOS, open the Terminal app. On Windows, labs run inside WSL 2 (the Windows Subsystem for Linux), so open its terminal.
- **How to type a command.** In this course, you type the text in a command block and press Enter. When a block starts with `$`, type what comes after it, not the `$` itself.

You do not need to know Kubernetes yet. Every word is explained the first time it appears.

### What your computer needs

Your computer needs the `astrona` tool, a container engine (Docker or Podman) and two Kubernetes tools, `kind` and `kubectl`. Two commands, `astrona setup` and `astrona check`, install and check all of them for you. The one lab in this module needs about 1.2 GB of memory for the container engine.

## The parts of this module

Read the parts in this order. Each one takes about 5 to 10 minutes.

| Part | What you learn |
| --- | --- |
| [Get Your Machine Ready](./course-01-get-your-machine-ready.md) | What a lab needs on your computer, and how `astrona setup` and `astrona check` get it ready |
| [The Four Steps Of Every Mission](./course-02-the-four-steps-of-every-mission.md) | Run, look, fix, submit and clean up: which command does what, and which tool does the work |
| [Read The State Of Your Ships](./course-03-read-the-state-of-your-ships.md) | Namespaces, pods, Deployments and images; reading `kubectl get` and `kubectl describe`; then your first graded mission |
| [Wrap-Up: Mission Debrief](./course-04-wrap-up.md) | What you learned, your mission, a short self-check and cleaning up |

## Why this matters

Every later Astrona lab, including the exam-style ones, uses this exact loop. Once it feels normal, you can spend all your attention on the real problem in each lab, not on the tools around it.

The lab also trains the most useful habit in Kubernetes: when something does not work, look before you change anything. `kubectl get` tells you *that* something is wrong. `kubectl describe` usually tells you *why*.
