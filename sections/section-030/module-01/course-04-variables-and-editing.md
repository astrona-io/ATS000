# Variables And Editing

You will type the same namespace name many times. A variable keeps a value under a short name. This part also teaches you to edit a file in the terminal and to bring back commands you typed before.

## Variables

A **variable** is a labelled box that holds a value. You set it once and read it as many times as you like. Set a variable with a name, an equals sign and a value. There are no spaces around the equals sign.

### Set and use a variable

Set the name of a planet and use it in a command:

```console
$ NS=terminal-lab
$ echo $NS
terminal-lab
```

The `$` in front of the name means "give me the value". Now use it in a roll call:

```sh
kubectl get pods -n $NS
```

The shell replaces `$NS` with `terminal-lab` before it runs the command. A variable lasts until you close the terminal window. The command `env` lists the variables the shell already has, and `echo $HOME` shows your home folder.

### Keep the result of a command

Write `$(...)` around a command to use its output as a value. This sets a variable to the name of the first Deployment:

```sh
FIRST=$(kubectl get deployments -n $NS -o name | head -n 1)
echo $FIRST
```

The `-o name` flag makes `kubectl` print only `deployment.apps/alpha` style names. The `head -n 1` keeps the first. Then `kubectl describe $FIRST -n $NS` works without a typed name.

> [!TIP]
> Put the lab's namespace in a variable at the start of a lab shell: `NS=first-lab`. Then every command ends in `-n $NS`, and you cannot mistype the name.

### Quotes

Double quotes still read `$NS`. Single quotes do not:

```console
$ echo "planet: $NS"
planet: terminal-lab
$ echo 'planet: $NS'
planet: $NS
```

## Edit a file and reuse commands

Sometimes you need to change a file, not only write one. The easiest editor in the terminal is `nano`. It shows its own key list at the bottom.

### Edit with nano

Open a file, type, save and leave:

```console
$ nano plan.txt
```

Type your text. Press `Ctrl+O` then Enter to save, and `Ctrl+X` to leave. If you land in `vi` or `vim` by mistake, press `Esc`, then type `:q!` and Enter to leave without saving. The command `kubectl edit` opens the editor named in the variable `EDITOR`, so `EDITOR=nano kubectl edit deployment/gamma -n $NS` opens the object in `nano`.

### Bring back old commands

The up arrow shows the previous command. Press `Ctrl+R` and type a few letters to search your history. `Ctrl+C` stops a command that runs too long, and `Ctrl+L` clears the screen.

## Common pitfalls

> [!WARNING]
> - **Spaces around the equals sign.** `NS = terminal-lab` fails. Write `NS=terminal-lab`.
> - **Expecting a variable to survive a new window.** A new terminal window has none of your variables. A lab shell from `astrona shell` is also a new shell.
> - **Typing `$` when setting.** Set with `NS=...`, read with `$NS`.
> - **Closing the editor without saving.** `Ctrl+X` asks whether to save. Answer `Y`.
> - **Pressing `Ctrl+C` to leave `less`.** Press `q`.

> *A variable keeps a value, `$(...)` keeps a result, and `nano` changes a file.*

## Your mission: Find The Silent Ships

You can now read a roll call, filter it and reuse names. Your mission: on the planet `shell-lab`, two fleet orders have no ship in flight, for two different reasons. Find them with a pipe and fix both.

Pause the playground first, so the lab has the memory it needs:

```sh
astrona stop ats-000-playground-030-01
```

Start the mission:

```sh
astrona run ATS000/section-030/module-01/lab-01
```

Read the task in [`question.md`](./labs/lab-01/question.md) and solve it on your own first, in a lab shell (`astrona shell`). When you think you are done, leave the lab shell and send it for grading:

```sh
astrona submit ATS000/section-030/module-01/lab-01
```

When the mission is done, remove the lab and start the playground again:

```sh
astrona destroy ats-000-lab-030-01-01
astrona start ats-000-playground-030-01
```
