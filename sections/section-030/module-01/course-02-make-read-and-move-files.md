# Make, Read And Move Files

Labs ask you to save YAML files and read long lists. This part teaches the eight commands you need for that: make a file, put text in it, read it, copy it, move it and remove it.

## Make a file and read it

A **file** holds text. You will make one with `echo`, a command that prints text, and a redirect that sends the text into a file instead of the screen.

### Write and read a note

Go to your notes folder, write a line into a file and read the file back:

<!-- astrona:playground:renew -->

```console
$ cd ~/mission-notes
$ echo "launch at dawn" > plan.txt
$ cat plan.txt
launch at dawn
```

The `>` sign sends the output into `plan.txt` and replaces whatever was there. The command `cat` prints the whole file. Use `>>` instead to add a line at the end without replacing:

```console
$ echo "check the fuel" >> plan.txt
$ cat plan.txt
launch at dawn
check the fuel
```

The command `touch notes.txt` makes an empty file, or updates the date of one that exists.

### Read a long file in pieces

A long file does not fit on the screen. Four commands help:

| Command | What it shows |
| --- | --- |
| `head -n 5 file` | The first 5 lines |
| `tail -n 5 file` | The last 5 lines |
| `less file` | The file one screen at a time. Press `q` to leave |
| `wc -l file` | The number of lines |

## Copy, move and remove

Three commands change where files are. They work on one name at a time, and they do not ask questions.

### Before and after

Here is a short session with its result in the comments:

```console
$ cp plan.txt plan-backup.txt
$ mv plan-backup.txt old-plan.txt
$ ls
notes.txt  old-plan.txt  plan.txt
$ rm notes.txt
$ ls
old-plan.txt  plan.txt
```

`cp` copies, so you have two files. `mv` moves or renames, so `plan-backup.txt` no longer exists under that name. `rm` removes a file for good: there is no wastebasket and no undo.

To work with several files, use a star. `ls *.txt` lists every name that ends in `.txt`.

> [!TIP]
> Before `rm` with a star, run `ls` with the same star first. What `ls` shows is exactly what `rm` would remove.

## Make a folder of files for the labs

Later parts ask you to "save this as `radar.yaml`". That means: make a file with that name, with the content you are given, in a folder where you can find it again. Make that folder now:

```console
$ mkdir -p ~/missions/yaml
$ cd ~/missions/yaml
$ pwd
/home/astro/missions/yaml
```

The `-p` flag makes every missing folder on the way, and does not complain if it exists.

## Common pitfalls

> [!WARNING]
> - **Using `>` when you meant `>>`.** A single `>` replaces the file. Your old text is gone.
> - **Running `rm -r` on the wrong folder.** The `-r` flag removes a folder and everything inside. Check with `pwd` and `ls` first.
> - **Copying onto an existing name.** `cp` and `mv` replace a file of the same name without a warning.
> - **Reading a huge file with `cat`.** Use `less`, `head` or `tail`.
> - **Forgetting the quotes.** `echo launch at dawn` works, but a text with `>` or `$` needs quotes.

> *`echo` and `>` write, `cat` reads, `cp` copies, `mv` moves, `rm` removes for good.*
