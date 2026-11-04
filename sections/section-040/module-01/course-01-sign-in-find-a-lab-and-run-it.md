# Sign In, Find A Lab And Run It

Before you fly, you sign in, and you pick a mission. This part walks through both, and starts your first environment.

## Set up and sign in

The `astrona` command talks to the Astrona service to fetch labs and to record your results. It needs to know who you are.

### First-time setup

If you installed the CLI a moment ago, `astrona setup` checks that the tools it needs are on your computer, such as Docker and `kubectl`. Run it once:

```sh
astrona setup
```

Read what it reports. If a tool is missing, install it, then run `astrona setup` again.

### Log in and check who you are

```sh
astrona login
astrona whoami
```

`astrona login` opens a sign-in flow. `astrona whoami` prints the account the CLI uses now. If a command later says you are not signed in, run `astrona login` again.

## Find a lab

The catalog is the list of missions. Each one has a name made from the course, the section, the module and the lab number.

### List the catalog

```sh
astrona labs
```

You should see a list of lab names. A name looks like `ATS000/section-040/module-01/lab-01`. Read it from left to right: course `ATS000`, section `040`, module `01`, lab `01`.

### Read about a lab

Once a lab is running, its background is one command away:

```sh
astrona docs prerequisites
astrona docs case-study
```

The first lists what you should know before the task. The second tells the story behind it.

## Run a lab

`astrona run` builds a fresh cluster for the lab. It takes a minute or two the first time, because it starts a cluster in Docker.

### Start your mission

```sh
astrona run ATS000/section-040/module-01/lab-01
```

When it finishes, your `kubectl` points at the new cluster, and the CLI remembers it as your current environment. Do not start this lab yet if your playground is running. The mission comes at the end of the module.

### Run a playground

A playground is run with a path to its folder, and has no grading:

```sh
astrona run -c .
```

Run that command from the playground's folder. The playground in this module is already launched for you by the page.

## Common pitfalls

> [!WARNING]
> - **Skipping `astrona setup`.** If Docker is not running, `astrona run` fails. Start Docker first.
> - **A typo in the lab name.** Copy it from `astrona labs`.
> - **Running two big labs at once.** Each one is a whole cluster. Stop or destroy the first.
> - **Not signed in.** Run `astrona login`, then `astrona whoami`.
> - **Waiting too little.** The first run downloads images. Give it a few minutes.

> *Sign in once, pick a lab by its full name, and give `astrona run` time to build the cluster.*
