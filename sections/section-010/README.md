# Section 010: Your First Lab

How an Astrona lab works, end to end, on the smallest possible problem. Astronaut, this is your first mission: you start a training solar system on your own computer, look at it with `kubectl`, fix one thing, and send it for grading.

## Modules

This section has one module and a capstone. The module teaches the lab loop that every later lab uses. The capstone makes you use the loop twice, on two planets, and a short quiz closes the section.

| Module | What you learn | Playground | Graded mission |
| --- | --- | --- | --- |
| [The Lab Loop: Run, Look, Fix, Submit](./module-01/course.md) | Getting your computer ready, the four steps of every lab, and reading pods with `kubectl get` and `kubectl describe` | `ats-000-playground-010-01`: the planet `first-lab` with a healthy `hello` and a broken `relay` | [Your First Lab: Bring A Deployment Back To Life](./module-01/labs/lab-01/README.md) |
| Capstone | Use the whole loop on two planets with two different image mistakes | none | [First Flight Check](./capstone/labs/lab-01/README.md) |

The section ends with a [knowledge check](./quiz.yaml). The [final quiz](../final-domain-quiz.yaml) covers both sections.

## What you need

A computer with about 1.2 GB of free memory for the container engine, and a terminal. The module shows you how `astrona setup` installs everything else.
