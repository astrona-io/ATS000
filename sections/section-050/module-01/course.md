# ConfigMaps And Secrets

Astronaut, a good ship does not carry its settings inside the hull. Settings live outside the image, so the same image can fly with different settings. Kubernetes has two objects for this: the ConfigMap for ordinary settings and the Secret for private values.

## Learning objectives

After this module you can:

- Create a ConfigMap from literals, from a file and from YAML.
- Create a Secret, and explain that base64 is an encoding, not protection.
- Give settings to a container as environment variables and as files.
- Explain which one updates in a running pod and which needs a restart.
- Read a `CreateContainerConfigError` and find the missing ConfigMap or Secret key.

## Before you start

You should know the kubectl toolkit and how to read a Deployment file. Your playground has the planet `config-lab` with a ConfigMap `site-config`, a Secret `site-secret` and a Deployment `site` that uses both. Launch it now and keep it running:

<!-- astrona:playground -->

## The parts of this module

Read the parts in this order. Each one takes about 10 minutes.

| Part | What you learn |
| --- | --- |
| [Create A ConfigMap](./course-01-create-a-configmap.md) | `create configmap`, literals, files, YAML |
| [Use Settings In A Ship](./course-02-use-settings-in-a-ship.md) | `env`, `envFrom`, volumes, what updates when |
| [Secrets And Base64](./course-03-secrets-and-base64.md) | `create secret generic`, encoding, decoding, limits |
| [When The Settings Are Missing](./course-04-when-the-settings-are-missing.md) | `CreateContainerConfigError`; then your graded mission |
| [Summary: Settings Outside The Hull](./course-05-summary.md) | What you learned, a short self-check and cleaning up |

## Why this matters

Hard-coded settings force a new image for every change. ConfigMaps and Secrets keep the image the same, and a missing one is one of the most common reasons a pod does not start.
