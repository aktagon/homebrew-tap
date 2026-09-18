#!/bin/sh
set -eu
# Point this repo's git hooks at the tracked .githooks directory.
git -C "$(git rev-parse --show-toplevel)" config core.hooksPath .githooks
echo "core.hooksPath -> .githooks (wrkgrd pre-commit hook active)"
