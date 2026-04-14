# Video

- https://www.youtube.com/watch?v=dywR2NLohEA

# Run the image

- `docker build -t claude:isolated .`
- put project in the project folder or mount a different directory in `claude.sh`
- `./claude.sh`

# Login

If pasting the login code does not work, try this workaround:

```
Found Workaround:

Workaround – Disable paste bracketing
iTerm2: Preferences → Profiles → Terminal → disable "Enable bracketed paste mode"

<img width="1026" height="667" alt="Image" src="https://github.com/user-attachments/assets/74e83074-98fd-4164-a04e-97cfbc5855a6" />

But dont forget to reactivate it again after auth...
```

(https://github.com/anthropics/claude-code/issues/47670#issuecomment-4241967389)

## Docker

see `Dockerfile`

- create an empty `claude/.claude.json` file
- spin the container up with `docker run --rm -it -v $(pwd)/project:/srv -v $(pwd)/claude/.claude:/root/.claude -v $(pwd)/claude/.claude.json:/root/.claude.json claude:isolated`

## `--dangerously-skip-permissions`

- the flag won't let us run claude as root. hence we need to update the `Dockerfile` to act as a different user, `claude`. this also changes the docker arguments: `docker run --rm -it -v $(pwd)/project:/srv -v $(pwd)/claude/.claude:/home/claude/.claude -v $(pwd)/claude/.claude.json:/home/claude/.claude.json claude:isolated`

# Questions

## Chrome?
