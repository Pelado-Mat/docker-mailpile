# Mailpile Docker image

A minimal Mailpile Docker image based on Alpine Linux.
Follows the master branch
Runs as a non-root user!

## Usage

```
docker run -d --name mailpile -p 33411:33411 m01cl/mailpile
```

Bind volume `/home/mailpile/.local/share/Mailpile` and `/home/mailpile/.gnupg` for persistent storage:

```
docker run -d --name mailpile -p 33411:33411 -v /some/local/path:/home/mailpile/.local/share/Mailpile -v /another/local/path:/home/mailpile/.gnupg m01cl/mailpile
```
