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
| 030 | [Find The Silent Ships](sections/section-030/module-01/labs/lab-01) | ~15 min | Pipes, `grep` and a roll call |
| 030 | [Write The Radar Fleet Order](sections/section-030/module-02/labs/lab-01) | ~15 min | Write a Deployment in YAML from nothing |
| 030 | [Capstone: The Deck Check](sections/section-030/capstone/labs/lab-01) | ~25 min | Pipes, a file and a Deployment together |
| 040 | [Read The Examiner's Hints](sections/section-040/module-01/labs/lab-01) | ~15 min | `astrona submit`, failed checks and hints |
| 040 | [Write A Note Inside A Ship](sections/section-040/module-02/labs/lab-01) | ~15 min | `-A`, `kubectl exec` |
| 040 | [Capstone: Mission Control Sweep](sections/section-040/capstone/labs/lab-01) | ~25 min | The whole toolkit on three planets |
| 050 | [Give The Gate Its Settings](sections/section-050/module-01/labs/lab-01) | ~15 min | ConfigMap, Secret, `CreateContainerConfigError` |
| 050 | [Undo The Bad Release](sections/section-050/module-02/labs/lab-01) | ~15 min | `kubectl rollout undo` |
| 050 | [Capstone: Cargo Hold Recovery](sections/section-050/capstone/labs/lab-01) | ~25 min | Missing settings and a bad release |
| 060 | [The Beacon That Reaches No One](sections/section-060/module-01/labs/lab-01) | ~15 min | Service selector and endpoints |
| 060 | [Capstone: The Four-Fault Drill](sections/section-060/capstone/labs/lab-01) | ~30 min | Four faults, one method |

Every module has an ungraded playground. Each section has a knowledge check, and a final quiz covers the whole course.

Browse every lab on https://astrona.io/labs or with `astrona labs`.
