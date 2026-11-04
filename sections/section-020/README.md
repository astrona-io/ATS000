# Section 020: Change And Repair The Fleet

Your first mission fixed one broken fleet order. Astronaut, this section asks for more. You change a running fleet, find ships by their labels, launch a new fleet from a file, and learn to tell the stuck ships apart: the ones with no launch pad and the ones that keep crashing.

## Modules

This section has two modules and a capstone. Each module has its own playground and one graded mission.

| Module | What you learn | Playground | Graded mission |
| --- | --- | --- | --- |
| [Scale, Label And Launch From A File](./module-01/course.md) | `kubectl scale`, labels and selectors, Deployment and Service files, `kubectl apply` | `ats-000-playground-020-01`: the planet `fleet-lab` with the healthy `crew` and `cargo` | [Launch A Fleet From A File](./module-01/labs/lab-01/README.md) |
| [Find Why Ships Will Not Fly](./module-02/course.md) | `Pending`, resource requests, `CrashLoopBackOff`, `kubectl logs`, `kubectl edit` | `ats-000-playground-020-02`: the planet `rescue-lab` with a Pending `hauler` and a crashing `flicker` | [Rescue Two Stuck Ships](./module-02/labs/lab-01/README.md) |
| Capstone | Scale, label, give a Service and rescue two stuck ships on one planet | none | [Fleet Recovery](./capstone/labs/lab-01/README.md) |

The section ends with a [knowledge check](./quiz.yaml). The [final quiz](../final-domain-quiz.yaml) covers all sections.

## What you need

The same setup as the first section. Each lab needs about 1.2 GB of memory for the container engine, and the playground should be stopped while a lab runs.
