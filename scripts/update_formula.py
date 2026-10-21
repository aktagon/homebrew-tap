"""Point a formula at a new release, taking each sha256 from its checksums.txt.

Usage: update_formula.py <tool> <tag> <checksums.txt>

Rewrites every `url "https://github.com/aktagon/<tool>/releases/download/..."`
line in Formula/<tool>.rb to <tag>, and the sha256 line under it to the
checksum of the same archive. Everything else in the formula (desc, license,
caveats, test) is hand-written and left alone.

Each tool's release workflow calls this, so there is one renderer for the
family rather than a copy per repository.

Fails, changing nothing, when the formula has no release url, or when an
archive the formula names is missing from checksums.txt.
"""

import pathlib
import re
import sys


def main(tool: str, tag: str, checksums_path: str) -> int:
    formula = pathlib.Path(__file__).resolve().parent.parent / "Formula" / f"{tool}.rb"
    text = formula.read_text()

    checksums = {}
    for line in pathlib.Path(checksums_path).read_text().splitlines():
        if line.strip():
            digest, name = line.split()
            checksums[name.lstrip("*")] = digest

    # url "<base>/<old tag>/<tool>-<old tag>-<triple>.<ext>"
    #   sha256 "<hex>"
    pattern = re.compile(
        r'(url "https://github\.com/aktagon/' + re.escape(tool)
        + r'/releases/download/)[^/"]+/' + re.escape(tool)
        + r'-[^-"]+-([^"]+)"(\s+sha256 ")[0-9a-f]{64}"'
    )

    missing = []

    def replace(match: re.Match) -> str:
        archive_suffix = match.group(2)
        archive = f"{tool}-{tag}-{archive_suffix}"
        digest = checksums.get(archive)
        if digest is None:
            missing.append(archive)
            return match.group(0)
        return f'{match.group(1)}{tag}/{archive}"{match.group(3)}{digest}"'

    updated, count = pattern.subn(replace, text)
    if count == 0:
        print(f"update_formula: no release url for {tool} in {formula}", file=sys.stderr)
        return 1
    if missing:
        print(f"update_formula: not in {checksums_path}: {', '.join(missing)}", file=sys.stderr)
        return 1

    formula.write_text(updated)
    print(f"update_formula: {formula.name} -> {tag} ({count} archive(s))")
    return 0


if __name__ == "__main__":
    if len(sys.argv) != 4:
        print(__doc__.strip().splitlines()[2], file=sys.stderr)
        sys.exit(2)
    sys.exit(main(*sys.argv[1:]))
