# Summary

Well flown, astronaut. Settings live outside the hull now. Check yourself, then clean up.

## What you learned

**From [Create A ConfigMap](./course-01-create-a-configmap.md):**

- `kubectl create configmap` takes `--from-literal` and `--from-file`. YAML works too.
- A pod only sees ConfigMaps in its own namespace.

**From [Use Settings In A Ship](./course-02-use-settings-in-a-ship.md):**

- Use `env`, `envFrom` or a volume. Environment variables update only after a restart.

**From [Secrets And Base64](./course-03-secrets-and-base64.md):**

- A Secret value is base64. That is an encoding, not protection. `stringData` lets you write plain text in a file.

**From [When The Settings Are Missing](./course-04-when-the-settings-are-missing.md):**

- `CreateContainerConfigError` means a ConfigMap, a Secret or a key is missing. `describe` names it.

## Your mission

| Mission | After the part | What you proved |
| --- | --- | --- |
| [Give The Gate Its Settings](./labs/lab-01/README.md) | When The Settings Are Missing | find a missing ConfigMap and Secret, create them and pass every check |

If you skipped it, go back to it now.

## Check yourself

<details>
<summary>1. Does base64 protect a Secret?</summary>

No. It is an encoding, and anyone can decode it.
</details>

<details>
<summary>2. You edit a ConfigMap. What does a running pod see?</summary>

Mounted files update after a short while. Environment variables stay the same until the pod restarts.
</details>

<details>
<summary>3. What status shows a missing ConfigMap?</summary>

<code>CreateContainerConfigError</code>.
</details>

<details>
<summary>4. Which field avoids hand-encoding in a Secret file?</summary>

Use <code>stringData</code> instead of <code>data</code>.
</details>

## Clean up

```sh
astrona list
astrona destroy ats-000-lab-050-01-01
astrona destroy ats-000-playground-050-01
```

Skip the first destroy if the list does not show the mission.

> *Keep settings in a ConfigMap, private values in a Secret, and restart to refresh variables.*

<!-- astrona:playground:destroy -->
