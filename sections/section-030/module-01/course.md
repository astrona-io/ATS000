# Find Your Way Around The Terminal

Astronaut, the terminal is the cockpit console of your computer. Every `astrona` and `kubectl` order in this course is typed there. If the console still feels strange, this module makes it familiar before the missions get harder.

You will learn where you are in the file system, how to make and read files, how to chain commands together, and how to keep a value in a variable. Each idea ends with something you type and see.

## Learning objectives

After this module you can:

- Show where you are with `pwd`, list what is around you with `ls`, and move with `cd`.
- Explain the difference between an absolute path and a relative path.
- Make folders and files, read them with `cat`, `head`, `tail` and `less`, and copy, move and remove them.
- Send the output of one command into another with a pipe, and filter it with `grep` and `wc`.
- Save output in a file with `>` and `>>`.
- Set and use a variable, use `$(...)`, and edit a file with `nano`.
- Use a pipe to find the Deployment that has no ready ship.

## Before you start

You need a terminal and nothing else. On macOS, open the Terminal app. On Windows, open the WSL 2 terminal (WSL 2 is a real Linux system that runs inside Windows). The commands in this module work on macOS and Linux.

In this module the sample folder names, such as `/home/astro`, are only examples. Your own folder names will differ.

### Your playground

The playground has the planet `terminal-lab` with three small Deployments: `alpha`, `beta` and `gamma`. Most of this module does not need it. You use it in the pipes part to filter a roll call. Launch it now and keep it running:

<!-- astrona:playground -->

## The parts of this module

Read the parts in this order. Each one takes about 10 minutes.

| Part | What you learn |
| --- | --- |
| [Where You Are: Paths And Folders](./course-01-where-you-are-paths-and-folders.md) | `pwd`, `ls`, `cd`, `mkdir`, absolute and relative paths |
| [Make, Read And Move Files](./course-02-make-read-and-move-files.md) | `touch`, `echo`, `cat`, `head`, `tail`, `cp`, `mv`, `rm` |
| [Pipes And Filters](./course-03-pipes-and-filters.md) | `\|`, `grep`, `wc`, `sort`, `>` and `>>`, applied to a `kubectl` roll call |
| [Variables And Editing](./course-04-variables-and-editing.md) | Variables, `$(...)`, `nano`, history; then your graded mission |
| [Summary: A Calm Cockpit](./course-05-summary.md) | What you learned, a short self-check and cleaning up |

## Why this matters

Almost every lab asks you to save a file, read a long list or reuse a name. A learner who is calm in the terminal spends the time on Kubernetes instead of on typing. Five small habits cover nearly everything you need.
