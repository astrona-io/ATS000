# Overview: ConfigMaps And Secrets (Playground)

This is a **playground**, not a lab. It starts a fresh training solar system and then waits. There is no task, no `astrona submit` and no pass or fail.

## What's in the box

- A single-node `kind` cluster. `kubectl` is already pointed at it.
- The planet `config-lab`: the ConfigMap `site-config` with `colour=blue` and `mode=calm`, the Secret `site-secret` with the key `key`, and the Deployment `site`.
- `site` loads every key of the ConfigMap as a variable, reads the Secret key as the variable `KEY`, and mounts the ConfigMap as files in `/etc/site`.

## Practice tasks

- Print the ConfigMap with `kubectl get configmap site-config -n config-lab -o yaml`.
- Print the Secret as YAML and decode the value with `base64 --decode` (use `-D` on older macOS).
- Run `kubectl exec deploy/site -n config-lab -- env` and `ls /etc/site`.
- Change `colour` in the ConfigMap with `kubectl edit`, and see which one changes in the pod and which one does not until a restart.
- Create a second ConfigMap from a literal and from a file.
