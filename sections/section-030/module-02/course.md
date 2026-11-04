# Read And Write YAML

Astronaut, a fleet order is a text file, and that file is written in YAML. If you can read YAML, every Kubernetes file stops being a wall of symbols. If you can write it, you can launch any ship you can describe.

This module teaches the language in four small steps, with a Deployment as the example all the way.

## Learning objectives

After this module you can:

- Read and write the three shapes of YAML: key and value, map and list.
- Explain why indentation matters and use spaces, never tabs.
- Write strings, numbers and booleans, and know when a value needs quotes.
- Name the four top-level parts of a Kubernetes file: `apiVersion`, `kind`, `metadata` and `spec`.
- Read a Deployment file line by line.
- Check a file with `kubectl apply --dry-run=client` and look up a field with `kubectl explain`.
- Write a Deployment file from nothing and apply it.

## Before you start

You should be able to make a file and open it in `nano`. Your playground is a single-node `kind` cluster with the planet `draft-lab`. It has one healthy Deployment called `sample` that has a label, a port and an environment variable. You print it as YAML and read it.

Launch your playground now, and keep it running next to you while you read the parts:

<!-- astrona:playground -->

## The parts of this module

Read the parts in this order. Each one takes about 10 minutes with the playground.

| Part | What you learn |
| --- | --- |
| [Maps, Lists And Indentation](./course-01-maps-lists-and-indentation.md) | The three shapes of YAML and the rule of spaces |
| [Strings, Numbers And Quotes](./course-02-strings-numbers-and-quotes.md) | Values, when to quote them, and multi-line text |
| [Anatomy Of A Fleet Order](./course-03-anatomy-of-a-fleet-order.md) | `apiVersion`, `kind`, `metadata`, `spec`, and a Deployment line by line |
| [Check A File Before You Launch It](./course-04-check-a-file-before-you-launch-it.md) | Dry run, `kubectl explain`, reading errors; then your graded mission |
| [Summary: A File You Can Trust](./course-05-summary.md) | What you learned, a short self-check and cleaning up |

## Why this matters

Labs that ask you to build something expect a file. One wrong space in a YAML file can make a whole Deployment wrong, or make `kubectl` refuse it. The habits here save you from the most common mistakes.
