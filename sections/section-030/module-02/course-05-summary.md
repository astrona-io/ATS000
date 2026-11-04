# Summary

Well flown, astronaut. You can read a fleet order and write one. Check yourself, then clean up.

## What you learned

**From [Maps, Lists And Indentation](./course-01-maps-lists-and-indentation.md):**

- YAML has a key and value, a map and a list. A dash starts a list item.
- Spaces show the structure. Use two spaces per level and never a tab.

**From [Strings, Numbers And Quotes](./course-02-strings-numbers-and-quotes.md):**

- Quotes turn a value into a string. An environment variable value such as `"3"` or `"on"` needs them.
- A colon followed by a space inside text needs quotes. `#` starts a comment.

**From [Anatomy Of A Fleet Order](./course-03-anatomy-of-a-fleet-order.md):**

- A Kubernetes file has `apiVersion`, `kind`, `metadata` and `spec`. Kubernetes writes `status`.
- The selector and the template labels of a Deployment must match. `---` separates objects in one file.

**From [Check A File Before You Launch It](./course-04-check-a-file-before-you-launch-it.md):**

- `kubectl apply --dry-run=client -f file` checks a file, and `--dry-run=server` also asks the cluster.
- `kubectl explain deployment.spec.replicas` prints the manual for a field.

## Your mission

You proved these moves in a graded mission, right after the part that taught them:

| Mission | After the part | What you proved |
| --- | --- | --- |
| [Write The Radar Fleet Order](./labs/lab-01/README.md) | Check A File Before You Launch It | write a Deployment file from nothing, check it, apply it and get a passing grade |

If you skipped it, go back to it now.

## Check yourself

Try to answer each question before you open the answer.

<details>
<summary>1. What does a dash at the start of a line mean in YAML?</summary>

It starts an item of a list.
</details>

<details>
<summary>2. Why does <code>value: 3</code> fail in an <code>env</code> list?</summary>

YAML reads <code>3</code> as a number, and the field needs a string. Write <code>value: "3"</code>.
</details>

<details>
<summary>3. Which four keys start a Kubernetes file?</summary>

<code>apiVersion</code>, <code>kind</code>, <code>metadata</code> and <code>spec</code>. Kubernetes adds <code>status</code>.
</details>

<details>
<summary>4. How do you check a file without creating anything?</summary>

Run <code>kubectl apply --dry-run=client -f file.yaml</code>, or <code>--dry-run=server</code> to let the cluster check too.
</details>

## Clean up

Each lab and each playground is a whole Kubernetes cluster running on your computer. See what is still running:

```sh
astrona list
```

If the list still shows the mission, remove it:

```sh
astrona destroy ATS000/section-030/module-02/lab-01
```

Then remove your playground by its name:

```sh
astrona destroy ats-000-playground-030-02
```

> *Two spaces, no tabs, quote the text, match the selector, and dry run first.*

<!-- astrona:playground:destroy -->
