# Strings, Numbers And Quotes

A value in YAML can be text, a number or a yes-or-no. Mostly YAML guesses right. This part shows where it guesses wrong, and how quotes fix that.

## What kind of value is it

YAML looks at a value and decides its kind. A **string** is text, a **number** is a number and a **boolean** is true or false. Kubernetes expects a certain kind in each field.

### The common kinds

| You write | YAML reads it as |
| --- | --- |
| `radar` | the string `radar` |
| `2` | the number 2 |
| `true` | the boolean true |
| `"2"` | the string `2` |
| `null` or `~` | no value |

Quotes turn any value into a string. Use double quotes `"..."` or single quotes `'...'`.

## Where quotes matter

Most text needs no quotes. A few values do. The rule: if YAML would read the value as something other than the text you meant, quote it.

### Numbers that must be strings

An environment variable in Kubernetes must hold a string. This fails:

```yaml
env:
  - name: LEVEL
    value: 3
```

Kubernetes refuses it, because `3` is a number and the field wants text. Quote it and the file is right:

```yaml
env:
  - name: LEVEL
    value: "3"
```

The same goes for `yes`, `no`, `on` and `off`. Some YAML readers treat them as booleans. If you mean the word, write `"on"`. The lab that sets `MODE` to `on` quotes it for exactly this reason.

### A colon inside text

A colon followed by a space starts a new key. Text that contains one needs quotes:

```yaml
message: "status: ready"
```

Without the quotes, YAML reads `message: status: ready` and stops with an error that says mapping values are not allowed in this context.

### Image names

An image name such as `nginx:1.27-alpine` has a colon, but no space after it, so it needs no quotes. A tag that looks like a number, for example `1.27`, can be read as a number. If you write it on its own, quote it.

## Longer text and comments

Some values are several lines long. Others are notes for the reader. YAML has a way to write both.

### Several lines in one value

A pipe sign starts a block where each line stays a line:

```yaml
message: |
  line one
  line two
```

A `>` sign works the same way, but joins the lines into one. You will meet blocks when you put a small file inside a ConfigMap.

### Comments

A `#` starts a comment. YAML and Kubernetes ignore the rest of the line. Use comments to explain a choice:

```yaml
replicas: 2   # two ships, so one can fail
```

> [!TIP]
> When you are unsure whether a value needs quotes, add them. Quoted text is always a string, and a string is what most Kubernetes fields want.

## Common pitfalls

> [!WARNING]
> - **An unquoted number in `env`.** Use `"3"`, not `3`.
> - **An unquoted `on`, `off`, `yes` or `no`.** Quote it.
> - **A colon and space inside text.** Quote the whole text.
> - **A `#` inside text.** `#` after a space starts a comment. Quote text that contains it.
> - **Mixing quote kinds.** Start and end with the same kind.

> *When a value must be text, quote it.*
