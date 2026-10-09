# Writing style for this repo

All study text here (course pages, lab docs, READMEs, comments in YAML and
scripts) is for people learning a technical subject, often for a
certification exam. Many of them are not native English speakers and have no
university degree.

## Plain English

Write the text in Plain English for a general adult audience (18+) without a
university degree. The content must be highly accessible and easy to
understand for non-technical readers, without feeling childish.

Strict guidelines:

1. Target a Flesch-Kincaid Grade Level of 8 or 9 (equivalent to a standard
   newspaper article).
2. Avoid all technical jargon, acronyms, and corporate buzzwords. If a
   technical term is necessary, explain it immediately using an everyday
   analogy.
3. Keep sentences conversational and direct. Split long sentences into two.
4. Use short paragraphs (max 3-4 sentences per paragraph) and clear
   subheadings to make the text scannable.
5. Use the active voice (e.g., "We did this" instead of "This was done by us").

## How this applies to course material

- **Know which file you are in.** A module has a short landing page and a few
  deep-dive parts. The landing page is a map: goals, what to know first, the
  order of the parts, where it fits. The real teaching goes in the parts. A lab
  has a task, a step-by-step solution and a short intro. Keep each file to its
  job. Do not add "Prerequisite: ... Next: ..." navigation lines to pages;
  the landing page and the course outline already give the order.
- **Keep each part short.** One idea per part, about 5 to 8 minutes of
  reading and at most about 8 command blocks, so a learner can finish it with
  the playground in one sitting of about 15 minutes. Split at a natural seam
  where each half ends with something the learner has seen work. Never split
  only to hit a number. When you split, renumber the files, fix every "Part N"
  reference in the module, the wrap-up links and `astrona.yaml`.
- **Every heading gets an intro.** A `##` section that has `###`
  subsections starts with one to three sentences that say what the section
  is about and why it matters, before the first `###`. Never put a `###`
  directly under a `##`.
- **Every module stands on its own.** Never refer to other sections or
  modules: no "see section 040", "as module 3 showed", "you met this in
  section 000", and no links to pages in another module. If the reader needs
  a fact from elsewhere, state the fact directly in one or two sentences.
  This also goes for parts of the same module: never write "Part 2 shows",
  "from Part 1" or "as in Part 3". Say the fact itself ("the commands below
  need the `hello` Deployment in the namespace `first-lab`"). The wrap-up page is the one
  exception: it recaps each part and links to it.
  The landing page does not have a "Where this fits" section.
- **Write words out in full.** Do not use informal short forms in prose:
  write "communications", "configuration", "repository", "administrator",
  "for example" and "that is", never "comms", "config", "repo", "admin",
  "e.g." or "i.e.". Names in code, commands and file paths stay as they are.
- **Exam terms stay.** The product's own names are what the reader must learn
  (for example a resource kind, a field, a command). Keep them, but explain
  each one in plain words, with an everyday analogy, the first time it appears
  in a file. Spell out acronyms on first use, with a short plain meaning.
- **Analogies come from space, and the reader is an astronaut.** When a term
  needs an everyday picture, use space: spaceships, planets, solar systems,
  space stations, mission control, signals, docking, star charts, airlocks,
  even the Death Star. Talk to the reader as an astronaut (for example "your
  first mission", "astronaut, check your flight log"), but not in every
  sentence. Requests are **signals** that ships send to each other. Use one
  analogy per hard idea, keep it short, and keep it the same everywhere (if
  the repository has an analogy glossary, use it). The analogy helps the reader; it
  never replaces the real term, and it never changes code or output.
- **Show one real example before the rule.** Start with a concrete case the
  reader can run, then give the general rule.
- **Say which part does the work.** Readers often mix up the parts of a system
  that sit close together. Whenever something happens, say which component
  did it.
- **Never change code to fit the style.** Commands, configuration files, field
  names, resource names, log lines and command output stay exactly as they
  are. They were run and checked on a real system. Never make up command
  output. If you shorten it, say that you did.
- **Prose only.** The grade-level and sentence rules apply to explanations.
  They do not apply to code blocks, tables of field names or reference lists
  (those may stay short and dense).
- **Keep the page furniture the same.** Hands-on steps are normal page
  content, not boxes: a short `###` subsection (for example "See it in your
  playground") with one sentence saying what to do, the command, the real
  output, and one or two sentences saying what it shows. A `> [!TIP]` box is
  only for a real tip: advice the reader can reuse beyond this one step (a
  habit, a shortcut, how to spot a problem, an exam habit). Everything else
  is a normal sentence: notes about the current step ("if the log line is
  old, run it again"), background facts, optional extra steps, and plain
  information. Never a command snippet, never two in a row, and most pages
  need zero or one tip. Each part ends with a
  `## Common pitfalls` `> [!WARNING]` block for that part only. Use a Mermaid
  diagram for a flow, an order or a state change, keep it under about 12
  boxes, and follow it with one sentence that says what it shows.
- **Labs come right after the part they practise.** Do not collect all
  graded labs at the end of a module. In `astrona.yaml`, put each lab (its
  `question.md` reading and the `lab` entry) right after the reading part it
  tests. If a part teaches a gradeable skill and no lab covers it, create a
  new lab. That part then ends with a `## Your mission: <lab title>` section:
  one sentence on what the reader can now do, one on what the mission asks,
  then pause the playground (`astrona stop <playground name>`), the
  `astrona run` and `astrona submit` commands, and finally
  `astrona destroy <lab name>` plus `astrona start <playground name>`. The
  wrap-up lists the missions and ends with cleaning up the playground
  (`astrona list`, `astrona destroy <playground name>`).
- **Renew the playground before hands-on work.** Every reading part that
  runs commands has `<!-- astrona:playground:renew -->` exactly once, on its
  own line, right before the first hands-on step (the first "Save this as"
  or the first command block), so the playground timer is reset before the
  learner needs the playground. Not on landing pages (they carry
  `<!-- astrona:playground -->`), wrap-up pages or pages without commands.
- **Mermaid without HTML.** The platform renders Mermaid with HTML labels
  switched off, so `<br/>` and any other HTML tag break the drawing. Rules:
  - One line per box, no `<br/>`, no HTML. Keep the box to the thing's name
    (`"hello pod"`, `"kubelet"`, `"Deployment: hello"`).
  - Put the logic on the arrows: `D -->|"replicas: 2"| P`,
    `K -->|"pull image"| R`, `S -->|"astrona submit"| G`. Keep edge labels short.
  - Quote every label. Prefer `flowchart TB`; use `LR` only for a short chain.
  - Sequence diagrams: short participant aliases (`participant K as kubectl`)
    and short message text.
  - Anything longer (cluster names, full hostnames) goes in the sentence under
    the diagram.
- **No links to outside sources.** Course pages, labs and playground docs do
  not link to or point at outside websites (the one exception is the
  `resources` field of a lab entry in `astrona.yaml`) (official docs, GitHub, blogs,
  RFCs), and they have no "Reference" or "Official docs" lists. Everything the
  reader needs is explained on the page itself. Not affected: addresses the
  reader actually uses in a command or browser (`http://127.0.0.1:9080`,
  `curl https://httpbin.org`), and the Mission Briefing's contributors and
  "report a mistake" links.
- **Configuration goes to a file first.** Whenever the reader should apply
  YAML (course parts, playground docs, labs), use three separate steps:
  1. "Save this as `deployment-hello.yaml`:" followed by a plain
     ` ```yaml ` block with only the YAML. No `cat > file <<'EOF'`, no
     `kubectl apply -f - <<EOF`, no shell around it.
  2. "Apply it:" followed by a ` ```sh ` block with only
     `kubectl apply -f deployment-hello.yaml`.
  3. "Then check the result:" followed by the check commands, if any.
  The file name says the kind and the object. If a value must come from the
  reader's cluster (an IP address), use a placeholder like `<PARTNER>` in the
  YAML and say how to get the value (`echo $PARTNER`); never put shell
  variables inside YAML. Apply an object the first time its YAML appears; do
  not show it once "to read" and paste it again later. Never tell the reader
  to apply something from the playground's `examples/` folder: they start the
  playground with `astrona run`, so that folder is not on their machine.
- **Helpers have readable names.** Shell helper functions and variables use
  names that say what they do (`check_route`, `count_versions`,
  `$SERVICE_URL`), never single letters.

## About this repo (ATS000 only)

Everything above is general and can be copied to other course repositories. This
section is only true for this one.

### What the student is trying to learn

- **The goal:** take a first Astrona lab from start to finish, and learn the
  loop every later lab uses: start the lab, look at the cluster, fix it,
  submit it for grading, and clean up. ATS000 is the "Getting Started"
  course. It is **not** tied to a certification exam, a domain or a domain
  weight. It is the door into the exam-style courses (for example the Istio
  Certified Associate courses ATS014 and ATS015), which all use the same loop.
- **Who it is for:** people who have never used the Astrona command-line
  tool, `kubectl` or a terminal much. Assume nothing beyond "can open a
  terminal and type a command". Every term is new to them.
- **What the course really tests:** that the student can *do* the loop on a
  live cluster: run `astrona run`, read `kubectl get` and `kubectl describe`,
  change one thing, and get a passing `astrona submit`. Every explanation
  should lead to something they type.
- **Exam topics:** none. The skills it covers are the base of every later
  course: the Astrona lab loop, namespaces, pods, Deployments, container
  images and tags, pod status and events.
- **The sections:**

  | Section | Title | Exam topic |
  | --- | --- | --- |
  | 010 | Your First Lab | None (getting started: the Astrona lab loop, first `kubectl` steps) |

- **The version:** the lab runs on a single-node `kind` cluster that
  `astrona run` builds inside Docker or Podman. The Kubernetes version is
  whatever the installed `kind` gives by default; the continuous integration
  workflow installs `kind` v0.32.0. The only image is `nginx:1.27-alpine`.
  Do not teach behaviour that depends on a newer or older Kubernetes version
  without saying so.
- **The main sources:** the Kubernetes documentation for pods, Deployments,
  images and debugging pods, and the `astrona` command-line tool's own
  `--help` text (`astrona run --help`, `astrona submit --help` and so on).
  Check every page against them.

### Space analogy glossary

Use these pictures for these terms, in every course page, lab and playground.
Keep them consistent so the astronaut builds one picture of the universe. It
is the same universe as the other Astrona courses (ATS014, ATS015), so a
learner who moves on keeps the same pictures.

**The universe**

| Term | Space picture |
| --- | --- |
| The learner | An astronaut (a cadet on their very first mission) |
| Kubernetes cluster | A solar system |
| `kind` cluster on your laptop | A training solar system in the simulator |
| Node | A launch pad: the place where ships are built and launched |
| Namespace | A planet in that solar system |
| Pod | A spaceship |
| Container | A module inside the ship (the app is the crew) |
| Kubernetes Service | A beacon: one call sign that a whole group of ships answers to |
| Port (`containerPort`) | A radio channel |
| Request / response | A signal sent out, and the reply signal |

**Ships and how they are built**

| Term | Space picture |
| --- | --- |
| Deployment | The fleet order: "keep this many ships of this design flying". It replaces a ship that breaks |
| `replicas` | How many ships the fleet order asks for |
| ReplicaSet (the hash in a pod name) | The batch of ships built from one version of the fleet order |
| Container image | The ship's blueprint |
| Image tag (`1.27-alpine`) | The version stamp on the blueprint |
| Image registry | The blueprint archive the launch pad downloads from |
| Pulling an image | The launch pad downloading the blueprint before it can build the ship |
| kubelet | The launch pad crew: they fetch the blueprint and start the ship |
| `ImagePullBackOff` | The launch pad crew failed to fetch the blueprint and now waits longer before each new try |
| `Running`, `READY 1/1` | The ship is in flight, and every module on board is ready |
| Control plane / API server | Mission control: it holds every order and reports on every ship |
| Events | Mission control's log book: short notes on what happened to a ship, newest at the bottom |

**Your tools**

| Term | Space picture |
| --- | --- |
| Terminal | The cockpit console you type orders into |
| `kubectl` | Your radio to mission control |
| `kubectl get` | A roll call: every ship answers with its name and state |
| `kubectl describe` | Opening one ship's full flight record |
| `kubectl set image` | Sending a new blueprint version to a fleet order |
| Docker or Podman (container engine) | The simulator hall the training solar system runs in |
| `astrona` command-line tool | The simulator's control desk |
| `astrona setup`, `astrona check` | The pre-flight check of your own machine |
| `astrona run` | Launching a training mission: the simulator builds the solar system and sets up the problem |
| `astrona shell` | A cockpit console whose radio is tuned to this mission's solar system only |
| `astrona submit` and the Proctor | Calling the flight examiner: they run their checklist against your solar system and give a score |
| Validation check and its hint | One line on the examiner's checklist, and the advice they give when it fails |
| `astrona destroy` | Switching the simulator off and clearing the solar system away |
| `astrona list` | The simulator's list of solar systems still running |

### The sample app and environment

There is no shared fleet in this course yet. The one lab runs its own tiny
app; use these names exactly as they are in the code:

| Kubernetes name | What it is |
| --- | --- |
| `first-lab` (namespace) | The planet the lab works on |
| `hello` (Deployment) | A tiny web app ("it's just nginx") with `replicas: 2` and the label `app: hello` |
| `web` (container in the `hello` pods) | The only container, on port `80` |
| `nginx:1.27-alpine` | The correct image. The lab starts with the broken tag `nginx:1.27-alpne` (one letter missing) |

The starting state is in `labs/lab-01/manifests/` (`00-namespace.yaml`,
`10-hello.yaml`); the reference end state is `labs/lab-01/solution/hello.yaml`.
The module has no playground. If one is added later, call it
`ats-000-playground-010-01` and put `<!-- astrona:playground -->` on the
landing page.

### Environment facts the text must respect

- **The lab uses `bootstrap.manifests`, not scripts.** `config.yaml` applies
  the `manifests/` folder and waits for the node. There are no `bootstrap/`,
  `solution/apply.sh` or `validation/` scripts in this repository.
- **Grading is three `jsonpath` checks** in `config.yaml` (4 points): the
  `hello` image is `nginx:1.27-alpine` (2 points), `spec.replicas` is still
  `2`, and `status.readyReplicas` is `2`. `question.md` and `solution.md`
  must match exactly these checks, and the hints in `config.yaml`.
- **The fixed image is preloaded.** `runtime.kind.preloadImages` loads
  `nginx:1.27-alpine` into the cluster, so the fix works without a download.
  The broken tag fails because it does not exist.
- **Memory and time:** the lab needs about 1.2 GB of memory for the
  container engine and builds in under a minute.
- **Catalog labs need an account.** `astrona run ATS000/section-010/module-01/lab-01`
  (the catalog name) needs `astrona login` first. Labs run from files or a
  repository (`-c`, `--git`) do not.
- **`astrona shell` leaves the learner's own terminal alone.** It opens a
  shell with `KUBECONFIG` set to the lab's own file; `exit` leaves it.
- **After a passing `astrona submit`**, the tool asks whether to delete the
  lab cluster now. Pressing Enter deletes it, like `astrona destroy`.

### Where things are in this repo

| What | Where |
| --- | --- |
| Course outline the platform reads: every reading page and lab, in order. Never list `solution.md` here | `astrona.yaml` |
| Overview, install steps, lab table | `README.md` |
| Section overview and its modules | `sections/section-010/README.md` |
| Module reading: landing page, deep-dive parts, wrap-up | `sections/section-010/module-01/course.md`, `course-0N-*.md` |
| Graded lab | `sections/section-010/module-01/labs/lab-01/` |
| Continuous integration: `astrona validate` and `astrona test` on every pull request | `.github/workflows/labs.yml` |

A lab folder holds:

| Path | Purpose |
| --- | --- |
| `config.yaml` | Lab definition; `metadata.docs` points `question` and `examQuestion` at `question.md`, `solution` and `guide` at `solution.md`, plus `prerequisites` and `caseStudy` in `docs/` |
| `README.md` | Short intro with `estimated_duration` front matter and the run, submit and destroy commands |
| `question.md` | The exam-style task. Starts with `# Question` and `Solve this question on: \`terminal\`` |
| `solution.md` | Step-by-step walkthrough with real output |
| `docs/prerequisites.md` | What the machine needs (`astrona docs prerequisites`) |
| `docs/case-study.md` | The same task with more guidance (`astrona docs case-study`) |
| `manifests/` | Starting state, applied by `bootstrap.manifests`, never the graded end state |
| `solution/` | Reference end state, applied only by `astrona test` |

### Lab metadata in `astrona.yaml`

`astrona.yaml` has one entry per section under `modules:` (`module-010`,
and later `module-020` and so on). Each section's `content` lists, in
order: the section `README.md`, then for each module its landing page, its
parts, and right after the part a lab tests, a `Question` reading
(`labs/lab-0N/question.md`) followed by the `type: lab` entry; the module's
wrap-up page comes last. A section capstone, when there is one, closes the
section. Playgrounds are not listed: the landing page's
`<!-- astrona:playground -->` marker shows them.

Every `type: lab` entry carries these fields, in this order:

```yaml
      - type: reading
        title: Question
        path: sections/section-010/module-01/labs/lab-01/question.md
      - type: lab
        title: "Your First Lab: Bring A Deployment Back To Life"
        path: sections/section-010/module-01/labs/lab-01
        difficulty: beginner
        estimated_duration: 10m
        topic: workloads
        task_kind: troubleshooting
        tags: [lab-loop, kubectl-get, kubectl-describe, deployment, image-tag, imagepullbackoff]
        learning_goals:
          - Start, submit and remove a lab with the astrona command-line tool
          - Read why a pod does not start from its status and events
        resources:
          - name: "Kubernetes Deployments"
            url: https://kubernetes.io/docs/concepts/workloads/controllers/deployment/
```

- `difficulty`: `beginner`, `intermediate` or `advanced`.
- `estimated_duration`: realistic time to solve it, for example `10m`, `15m`, `30m`.
- `topic`: exactly one of `lab-loop` (using the `astrona` tool itself),
  `workloads` (pods, Deployments, images), `inspection` (reading the cluster
  with `kubectl`), `configuration` (namespaces, labels, YAML files).
- `task_kind`: exactly one of `build` (write the configuration from
  scratch), `troubleshooting` (find and fix what is broken) or `migration`
  (move a working setup to another mode or layout). The platform filters
  labs by it, so it is a field of its own, never a tag.
- `tags`: 4 to 8 ids, only from the tag list below. Add a new tag to the list
  first if nothing fits.
- `learning_goals`: 2 or 3 plain sentences, each starting with a verb, saying
  what the learner proves in this lab.
- `resources`: 1 to 4 documentation pages, each with a `name` and a `url`
  that loads. This is the **only** place outside links are allowed: the
  platform shows them as optional further reading next to the lab.

**Tag list** (lower case, hyphens, never synonyms):

- Astrona tool: `lab-loop`, `astrona-run`, `astrona-shell`, `astrona-submit`,
  `astrona-destroy`, `astrona-setup`
- Kubernetes objects: `namespace`, `pod`, `deployment`, `replicaset`,
  `container`, `labels`
- Images: `container-image`, `image-tag`, `image-pull`, `preloaded-image`
- Reading the cluster: `kubectl-get`, `kubectl-describe`, `events`,
  `pod-status`, `ready-count`
- Changing the cluster: `kubectl-set-image`, `kubectl-edit`, `kubectl-apply`,
  `replicas`
- Failure signatures: `imagepullbackoff`, `errimagepull`, `crashloopbackoff`,
  `pending`

### Running things

```bash
# Lab (graded against the live cluster), from the repository
astrona run --git ssh://git@github.com/astrona-io/ATS000.git -c sections/section-010/module-01/labs/lab-01
astrona submit -c sections/section-010/module-01/labs/lab-01
astrona destroy ats-000-lab-010-01   # takes metadata.name from config.yaml, not the path

# The same lab from the catalog (needs astrona login); this is what the course pages use
astrona run ATS000/section-010/module-01/lab-01
astrona shell
astrona submit ATS000/section-010/module-01/lab-01
astrona destroy ATS000/section-010/module-01/lab-01

# Authors: check the configuration, and prove the lab passes with its reference solution
astrona validate -c sections/section-010/module-01/labs/lab-01
astrona test -c sections/section-010/module-01/labs/lab-01
```

Names: a playground is `ats-000-playground-<section>-<module>`. The first
lab is `ats-000-lab-<section>-<module>` (`ats-000-lab-010-01`); keep that
name. A new lab takes `ats-000-lab-<section>-<module>-<lab>`, for example
`ats-000-lab-010-01-02`, so two labs never share a name. Every lab must pass
`astrona validate` and `astrona test`.

Test clusters on the maintainer's machine: one at a time. Podman has 10 GiB
and also runs the platform stack; parallel clusters run it out of memory.
Never touch clusters you did not create.

### Where to find trusted sources

Check facts here before writing them down. Prefer these over memory.

- **Pods and Deployments:**
  <https://kubernetes.io/docs/concepts/workloads/pods/> and
  <https://kubernetes.io/docs/concepts/workloads/controllers/deployment/>
- **Images, tags and pulling:**
  <https://kubernetes.io/docs/concepts/containers/images/>
- **Finding out why a pod does not start:**
  <https://kubernetes.io/docs/tasks/debug/debug-application/debug-pods/>
- **Namespaces:**
  <https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/>
- **kubectl:** <https://kubernetes.io/docs/reference/kubectl/quick-reference/>
  and the `kubectl set image` reference
  <https://kubernetes.io/docs/reference/kubectl/generated/kubectl_set/kubectl_set_image/>
- **kind:** <https://kind.sigs.k8s.io/>
- **The astrona tool:** `astrona --help` and `astrona <command> --help` are
  the source of truth for what each command does. (The lab-config reference
  link in `config.yaml`, `https://cli.astrona.io/reference/lab-config/`,
  did not load when this file was written.)

### Skills to use here

The `astrona-course-*` skills do most authoring jobs in this repository: planning
(`domain-plan`), creating the tree (`domain-scaffold`), building modules
(`domain-build`), deep-dive parts (`deep-dive`), labs and playgrounds (`lab`),
lab docs (`lab-docs`), challenges (`create-challenge`), quizzes
(`generate-assessment`) and fact-checking (`review-accuracy`).
