# Case study: a beacon that points at nothing

The ships of `frontend` are all in flight, yet nobody can call them through the beacon `front`. The beacon is wrongly set up.

## Things worth knowing before you start

- A Service sends signals to the pods whose labels match its `selector`.
- `kubectl get endpoints front -n mixed-lab` lists the addresses behind a Service. An empty list means no pod matched. (Newer versions of kubectl may print a note that Endpoints are deprecated in favour of EndpointSlices; the command still works.)
- `targetPort` is the port the container listens on. `port` is the port of the Service.
- `kubectl get pods --show-labels` shows the labels of every pod.

## What to do

Compare the labels with the selector, check the port, fix the Service, and submit.
