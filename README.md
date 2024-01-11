[![CI](https://github.com/gdamjan/matrix-appservice-irc-service/actions/workflows/ci.yml/badge.svg)](https://github.com/gdamjan/matrix-appservice-irc-service/actions/workflows/ci.yml)

# `Matrix IRC Bridge` as a systemd portable service

Build an immutable [Matrix IRC Bridge](https://matrix-org.github.io/matrix-appservice-irc/latest/) image for
a systemd [portable service](https://systemd.io/PORTABLE_SERVICES/).
Made with nixos.

## Quick Start

Get the latest image from [Github releases](https://github.com/gdamjan/matrix-appservice-irc-service/releases/), into
`/var/lib/portables` and then run:

```sh
portablectl attach --enable --now matrix-appservice-irc…
```

## More info

See the [wiki](https://github.com/gdamjan/matrix-appservice-irc-service/wiki/) for more info.
