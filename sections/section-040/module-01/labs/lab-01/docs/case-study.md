# Case study: a console that fails its first inspection

The planet `console-lab` has two fleet orders that will fail the examiner's checklist. This lab is built so that your first `astrona submit` shows you the checklist.

## Things worth knowing before you start

- Submit once before you change anything. Each failed check prints a hint.
- A hint names the object and the kind of change. It does not give you the command.
- `astrona submit` can be repeated as often as you like.
- `astrona submit --watch` grades again every few seconds while you work.
- `astrona status` shows the health of the lab and the last result.

## What to do

Submit, read the hints, fix one thing at a time, and submit again until every check passes.
