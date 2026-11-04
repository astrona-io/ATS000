# Section 050: ConfigMaps, Secrets And Rollouts

Astronaut, a good ship carries its settings outside the hull, and a good crew can undo a bad release. This section covers both.

## Modules

This section has two modules and a capstone. Each module has its own playground and one graded mission.

| Module | What you learn | Playground | Graded mission |
| --- | --- | --- | --- |
| [ConfigMaps And Secrets](./module-01/course.md) | Create, use as variables and files, base64, `CreateContainerConfigError` | `ats-000-playground-050-01`: the planet `config-lab` with `site` | [Give The Gate Its Settings](./module-01/labs/lab-01/README.md) |
| [Rollouts And Rollback](./module-02/course.md) | ReplicaSets, `set image`, `rollout status`, `history`, `undo`, `pause`, `restart` | `ats-000-playground-050-02`: the planet `rollout-lab` with `shuttle` | [Undo The Bad Release](./module-02/labs/lab-01/README.md) |
| Capstone | Missing settings and a bad release on one planet | none | [Capstone: Cargo Hold Recovery](./capstone/labs/lab-01/README.md) |

The section ends with a [knowledge check](./quiz.yaml). The [final quiz](../final-domain-quiz.yaml) covers all sections.

## What you need

The setup from the first section. The rollout labs start by applying two releases, so they take a little longer to build. Stop the playground while a lab runs.
