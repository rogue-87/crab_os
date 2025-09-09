# Crab OS

my attempt at learning osdev in rust
all I'm doing is really just following this [guide/tutorial](https://os.phil-opp.com/)

## Project Setup

instead of using rustup for managing rust installations, I use nix package manager([determinate nix flavor :D](https://determinate.systems/)) & [rust-overlay](https://github.com/oxalica/rust-overlay).

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

## running the OS

### Booting it in QEMU

```sh
cargo run
```

### Booting it on a real machine

if you're on linux, use the `dd` command to write the OS into the USB stick. sdX is the the device name of your USB stick.

```sh
dd if=target/x86_64-blog_os/debug/bootimage-blog_os.bin of=/dev/sdX && sync
```
