# ATS000 — Getting Started

The first Astrona training: start here if you are new to the Astrona CLI,
kubectl or the terminal. Each lab runs on your own computer.

```sh
brew install astrona-io/tap/astrona   # Windows: https://astrona.io/labs/setup
astrona setup                         # installs and checks what labs need
astrona run ATS000/section-010/module-01/lab-01
```

| Section | Lab | Time | What you practise |
| --- | --- | --- | --- |
| 010 | [Your First Lab: Bring A Deployment Back To Life](sections/section-010/module-01/labs/lab-01) | ~10 min | `astrona run` → `kubectl get`/`describe` → fix → `astrona submit` |
| 010 | [Capstone: First Flight Check](sections/section-010/capstone/labs/lab-01) | ~15 min | Two wrong images on two planets |
| 020 | [Launch A Fleet From A File](sections/section-020/module-01/labs/lab-01) | ~15 min | `kubectl apply`, labels, Deployment and Service files |
| 020 | [Rescue Two Stuck Ships](sections/section-020/module-02/labs/lab-01) | ~15 min | `Pending`, crash loops, `kubectl logs` |
| 020 | [Capstone: Fleet Recovery](sections/section-020/capstone/labs/lab-01) | ~25 min | Scale, label, Service, Pending and crash loop together |

Every module has an ungraded playground. Each section has a knowledge check, and a final quiz covers the whole course.

Browse every lab on https://astrona.io/labs or with `astrona labs`.
