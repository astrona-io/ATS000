# Module 1: The lab loop

Every Astrona lab is the same four steps:

1. **Start** — `astrona run <lab>` builds a small Kubernetes cluster on your
   computer and sets up a problem in it.
2. **Look** — `astrona shell` opens a shell where `kubectl` talks to that
   cluster. `kubectl get` lists things; `kubectl describe` explains them.
3. **Fix** — change the cluster until it matches the task.
4. **Submit** — `astrona submit <lab>` grades the cluster, check by check, and
   shows a hint for anything that fails. Keep going and submit again.

When you are done, `astrona destroy <lab>` removes the cluster.

The lab in this module practises exactly that loop on one mistyped image tag.
