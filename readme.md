# Crab OS

my attempt at learning osdev in rust
all I'm doing is really just following this [guide/tutorial](https://os.phil-opp.com/)

## Project Setup

instead of using rustup for managing rust installations, I use nix package manager([determinate nix flavor :D](https://determinate.systems/)) & [rust-overlay](https://github.com/oxalica/rust-overlay).

The only extra thing you may need to install is [qemu](https://www.qemu.org/). It should be available in most linux distros package repositories.

Once you have nix installed, all you need to do is run this command

```sh
nix develop
```

by default it uses bash, so if you want to use your shell, type one of these commands

```sh
# for zsh
nix develop --command zsh
# for fish
nix develop --command fish
```

this will install all the stuff you need for working with this project

## Build

just run this command

```sh
cargo run
```
