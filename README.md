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
| `ctxgrd` | 3.0.0 | Documents: ADR, PRD, SPEC, HANDOFF, DEC, README structure |
| `pubgrd` | 0.2.0 | Public repository trees copied from private ones |

Both install a prebuilt binary from the project's GitHub release, for macOS on
Apple silicon and Intel, and Linux on x86_64. Both are licensed under the
Elastic License 2.0.

## Not here yet

`wrkgrd`, `grd`, `trtlgrd` and `mlgrd` publish no releases, so they have no
formula. Build them from their own repositories with `make install` until they
do.

## Updating a formula

Releases carry a `checksums.txt`. Take the version, the asset URLs and the
matching checksums from the release, then verify before pushing:

```bash
brew audit --strict aktagon/tap/ctxgrd
brew install --build-from-source aktagon/tap/ctxgrd
```
