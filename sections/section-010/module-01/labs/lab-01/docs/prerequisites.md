# Before you start

You need three things — `astrona setup` installs and checks them for you:

1. **The Astrona CLI.** macOS and Linux: `brew install astrona-io/tap/astrona`.
   Windows: see https://astrona.io/labs/setup (it uses WSL 2).
2. **Docker or Podman, running.** Labs run their Kubernetes cluster inside it.
3. **kind and kubectl.** kind builds the cluster; kubectl is how you talk to it.

Then, in a terminal:

```sh
astrona setup     # installs what is missing — it asks before each step
astrona check     # every "Required" line should show ✓
```

New to the terminal? Read https://astrona.io/labs/terminal first — it takes
five minutes and covers everything this lab uses.

This lab needs about 1.2 GB of memory for the container engine and builds in
under a minute.
