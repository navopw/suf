# suf

> Fixes the "Cannot open your terminal" error when using `screen` after `su` on Linux.

When you switch users with `su` and then try to start a `screen` session, you'll get `Cannot open your terminal - please check`. `suf` works around this by switching users and launching a shell via `script` instead of `screen`, avoiding the TTY ownership conflict.

### What happens if you use `su` with `screen` (error)
![terminal](http://i.imgur.com/UJS2WM8.png)

### What happens if you use `suf` with `screen` (working)
![terminal2](http://i.imgur.com/UPULSvJ.png)

## Features

- **Simple usage** — `suf username` is all you need
- **User validation** — Checks if the target user exists before switching
- **No dependencies** — Pure bash script, uses `su` and `script` which are pre-installed on most systems

## Prerequisites

- Linux with `su`, `getent`, and `script` (standard util-linux tools)
- Root/sudo access for installation

## Installation

```bash
wget https://raw.githubusercontent.com/navopw/suf/main/install.sh -O install.sh
sudo sh install.sh
```

## Usage

```bash
suf username
```

This switches to the specified user, changes to their home directory, and opens an interactive shell session.

## How it works

Instead of running `su username` and then `screen`, `suf` runs:
```
su "username" -c "cd /home/username; script /dev/null;"
```

The `script /dev/null` trick allocates a new pseudo-terminal, avoiding the TTY ownership check that `screen` performs.

## Bugs and suggestions

[Create an issue](https://github.com/navopw/suf/issues/new)

## License (MIT)

Copyright © 2016 [navopw](https://github.com/navopw)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
