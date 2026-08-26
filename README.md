# dotfiles

Cross-platform dotfiles managed with [dotling](https://github.com/auricvex/dotling).

## Pre-req

* [dotling](https://auricvex.github.io/dotling/getting-started.html) — `cargo install dotling` or `brew install dotling`
* go
* cmake, make, fzf, rg — needed by neovim
* tmux
* neovim
* [starship](https://starship.rs)
* [Atuin](https://atuin.sh/)

## Setup on a new machine

```sh
dotling init git@github.com:geekgonecrazy/dotfiles.git
dotling sync
source ~/.zshrc
```

If you have encrypted entries, import your vault first:

```sh
dotling vault import my-vault.bundle
dotling sync
```

## What gets tracked

| Config | Deployed to | Notes |
|--------|-------------|-------|
| `.zshrc` | `~/.zshrc` | |
| `.tmux.conf` | `~/.tmux.conf` | |
| `.config/alacritty/` | `~/.config/alacritty/` | |
| `.config/i3/` | `~/.config/i3/` | Linux only |
| `.config/i3status/` | `~/.config/i3status/` | Linux only |
| `.config/nvim/` | `~/.config/nvim/` | Copy mode (not symlinked) |
| `.cargo/config` | `~/.cargo/config` | |
| `.local/share/fonts/` | `~/.local/share/fonts/` | |
| `bin/` | `~/bin/` | |
| `.Xresources-xps13` | `~/.Xresources-xps13` | Linux only |

## Neovim

Launch nvim and do `:PackerInstall`. From here Mason should kick off and start installing some other needed plugins.
