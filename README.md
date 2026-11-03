# homebrew-tap

Homebrew formulae for the Aktagon `*grd` linters.

## Install

```bash
brew tap aktagon/tap
brew install aktagon/tap/ctxgrd
```

## Formulae

| Formula | Version | What it lints |
|---------|---------|---------------|
| `ctxgrd` | 5.9.0 | Documents: ADR, PRD, SPEC, HANDOFF, DEC, README structure |
| `pubgrd` | 0.2.0 | Public repository trees copied from private ones |
| `aigrd` | 0.3.1 | Agent output, judged by a second model against a rubric |
| `grd` | 0.2.0 | Coordinator: Claude Code hook dispatch, git hook audit |
| `wrkgrd` | 0.4.0 | Code: build, tests, lint configuration, secret scan |

Each installs a prebuilt binary from the project's GitHub release, for macOS on
Apple silicon and Intel, and Linux on x86_64. `ctxgrd` and `pubgrd` are licensed
under the Elastic License 2.0, `aigrd`, `grd` and `wrkgrd` under MIT.

## Rust

### Why rust-dev exists

We want one Rust per Mac, always the latest stable release, that every user
and every agent shares. Two common setups fail that goal:

- **Homebrew's `rust` can't build for the browser.** Its compiler rejects
  Rust's official wasm32 library, so web builds fail. rustup installs the
  compiler and that library from the same release, so they always match.
- **Plain rustup installs a Rust for every project.** A project's
  `rust-toolchain.toml` can ask for any version, and rustup installs it
  without asking. One Mac ended up with four Rusts this way.

`rust-dev` installs rustup with the tools our projects need: clippy, rustfmt,
llvm-tools (for `cargo llvm-cov`), the wasm32 target, `cargo-deny`, `trunk`
and `wasm-bindgen`.

### How to set it up

1. **Remove Homebrew's Rust**, because two Rusts mean two versions. rust-dev
   refuses to install beside it:

   ```bash
   brew uninstall rust            # only if it is installed
   ```

2. **Install rust-dev, and put Rust in one shared folder.** As the admin user,
   so every user on the Mac reads the same copy:

   ```bash
   brew install aktagon/tap/rust-dev
   mkdir -p "$(brew --prefix)/var/rustup"
   RUSTUP_HOME="$(brew --prefix)/var/rustup" rust-dev-setup
   ```

3. **Point every user at that folder, and stop projects from asking for other
   versions.** Add these lines to each user's `~/.zshenv`. Agent jobs that
   start with an empty environment need them too:

   ```bash
   export RUSTUP_HOME="$(brew --prefix)/var/rustup" RUSTUP_TOOLCHAIN=stable
   export PATH="$(brew --prefix rustup)/bin:$PATH"
   ```

   `RUSTUP_TOOLCHAIN=stable` overrides every `rust-toolchain.toml`, so no
   second version gets installed.

4. **Check it**, in a new terminal, so `~/.zshenv` is read:

   ```bash
   rustup show home                   # /opt/homebrew/var/rustup
   rustc --version                    # no "(Homebrew)" at the end
   rustup component list --installed  # llvm-tools and rust-std-wasm32-unknown-unknown
   which -a cargo                     # /opt/homebrew/opt/rustup/bin/cargo, no ~/.cargo/bin/cargo
   ```

To update, run `brew upgrade aktagon/tap/rust-dev`, then the `rust-dev-setup`
line from step 2 again.

### Rules that keep it working

- **Never run `rustup self uninstall`.** It deletes `RUSTUP_HOME`, which is now
  everyone's Rust, and all of `~/.cargo`. To remove an old rustup.rs install,
  delete its links and its own folder instead:

  ```bash
  (cd ~/.cargo/bin && rm -f rustup cargo cargo-clippy cargo-fmt cargo-miri clippy-driver rls rust-analyzer rust-gdb rust-gdbgui rust-lldb rustc rustdoc rustfmt) && rm -rf ~/.rustup
  ```

- **Keep `wasm-bindgen` at the project's version, and never pin it.** The
  browser test runner must be exactly the version in `Cargo.lock`. If it
  isn't, the tests fail with "a different bindgen format". When Homebrew
  moves to a new version, update `Cargo.lock` to match. Don't downgrade the
  project, and don't `cargo install` a second copy. A `brew pin` stops the
  upgrade and breaks this without warning:

  ```bash
  brew unpin wasm-bindgen && brew upgrade wasm-bindgen
  ```

- **If `rust-dev-setup` is missing, install rust-dev by itself.** `brew bundle`
  stops early if you cancel a password prompt, and then rust-dev never gets
  installed. Run step 2 again.

- **Use Chrome for Testing's driver for browser tests.** Homebrew's
  `chromedriver` cask is disabled, because it fails macOS Gatekeeper.

## Not here yet

`trtlgrd` and `mlgrd` publish no public releases, so they have no
formula. Build them from their own repositories with `make install` until they
do.

## Updating a formula

Releases carry a `checksums.txt`. `scripts/update_formula.py` rewrites a
formula's urls and sha256 lines from it, and leaves everything else alone:

```bash
gh release download v5.9.0 -R aktagon/ctxgrd -p checksums.txt
uv run scripts/update_formula.py ctxgrd v5.9.0 checksums.txt
```

Verify before pushing:

```bash
brew audit --strict aktagon/tap/ctxgrd
brew install --build-from-source aktagon/tap/ctxgrd
```
