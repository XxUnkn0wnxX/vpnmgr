#!/bin/sh
# changelog-notes.sh
#
# Prints the body of one version's section of CHANGELOG.md, for release notes.
# Exits 1 if the version has no section or the section is empty.
#
# Usage:
#   sh scripts/changelog-notes.sh v3.4.0

if [ -z "$1" ]; then
	printf 'Usage: sh scripts/changelog-notes.sh <version>\n' >&2
	exit 1
fi

_cn_file="$(cd "$(dirname "$0")/.." && pwd)/CHANGELOG.md"

# The section starts at "## <version>" (optionally followed by a date) and runs
# to the next "## " heading. Leading and trailing blank lines are dropped.
_cn_notes="$(awk -v v="$1" '
	index($0, "## " v " ") == 1 || $0 == "## " v { found = 1; next }
	found && /^## / { exit }
	found { print }
' "$_cn_file" | sed '/./,$!d')"

if [ -z "$(printf '%s' "$_cn_notes" | tr -d '[:space:]')" ]; then
	printf 'CHANGELOG.md has no entries for %s\n' "$1" >&2
	exit 1
fi

printf '%s\n' "$_cn_notes"
