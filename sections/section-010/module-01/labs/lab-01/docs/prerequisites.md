# Before you start

Every mission starts with a pre-flight check. You need three things on your computer, and `astrona setup` installs and checks them for you:

1. **The Astrona command-line tool.** macOS and Linux: `brew install astrona-io/tap/astrona`.
   Windows: see https://astrona.io/labs/setup (it uses WSL 2, the Windows Subsystem for Linux).
2. **Docker or Podman, running.** This is the container engine, the simulator hall where the lab's Kubernetes cluster runs.
3. **kind and kubectl.** `kind` builds the cluster; `kubectl` is how you talk to it, your radio to mission control.

Then, in a terminal:

```sh
astrona setup     # installs what is missing — it asks before each step
astrona check     # every "Required" line should show ✓
```

New to the terminal? Read https://astrona.io/labs/terminal first. It takes five minutes and covers everything this lab uses.

This lab needs about 1.2 GB of memory for the container engine and builds in under a minute.
