# Overview: Find Your Way Around The Terminal (Playground)

This is a **playground**, not a lab. It starts a fresh training solar system and then waits. There is no task, no `astrona submit` and no pass or fail.

## What's in the box

- A single-node `kind` cluster. `kubectl` is already pointed at it.
- The planet (namespace) `terminal-lab`, with three fleet orders (Deployments): `alpha` with 2 replicas, `beta` with 1 replica and `gamma` with 0 replicas.
- Your own computer's shell, where you practise paths, files, pipes and variables. These do not need the cluster.

## Practice tasks

- Run `pwd`, `ls` and `cd`, and make a folder called `mission-notes`.
- Save the roll call of the planet in a file with `kubectl get deployments -n terminal-lab > roll-call.txt`, and read it with `cat`.
- Use `grep` and `wc -l` on the roll call.
- Set a variable `NS=terminal-lab` and run `kubectl get pods -n $NS`.
- Find `gamma` with a pipe, and scale it to 1.
