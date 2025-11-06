#!/usr/bin/env bash

set -euo pipefail

# Strip .md suffixes from internal doc references inside MDX files.
CONTENT_DIR="${1:-content/docs}"

if [[ ! -d "$CONTENT_DIR" ]]; then
  echo "Directory '$CONTENT_DIR' not found." >&2
  exit 1
fi

found=0

while IFS= read -r -d '' file; do
  if rg -q '\.md([)#?])' "$file" || rg -q "(?:href|to)=[\"'][^\"']*\\.md" "$file"; then
    perl -0pi -e 's/(\[[^\]]*\]\([^)]*?)\.md((?:[#?][^)]*)?\))/\1\2/g;
                  s/((?:href|to)=["][^"]*?)\.md((?:[#?][^"]*)?["])/\1\2/g;
                  s/((?:href|to)=\047[^\047]*?)\.md((?:[#?][^\047]*)?\047)/\1\2/g;' "$file"
    found=1
  fi
done < <(find "$CONTENT_DIR" -type f -name '*.mdx' -print0)

if [[ "$found" -eq 0 ]]; then
  echo "No .md references detected under '$CONTENT_DIR'." >&2
else
  echo "Removed .md suffixes from references under '$CONTENT_DIR'."
fi
