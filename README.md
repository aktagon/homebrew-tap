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

Each installs a prebuilt binary from the project's GitHub release, for macOS on
Apple silicon and Intel, and Linux on x86_64. `ctxgrd` and `pubgrd` are licensed
under the Elastic License 2.0, `aigrd` and `grd` under MIT.

## Not here yet

`wrkgrd`, `trtlgrd` and `mlgrd` publish no public releases, so they have no
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
