#!/usr/bin/env bash
# Tags the current commit as v<VERSION> if that tag does not exist yet.
# Used by .github/workflows/tag-release.yml on every push to the default branch.
# Set PUSH=0 to create the tag locally without pushing (used when testing).
set -euo pipefail

version_file="${VERSION_FILE:-VERSION}"
if [ ! -f "$version_file" ]; then
  echo "error: $version_file not found" >&2
  exit 1
fi

version="$(tr -d '[:space:]' < "$version_file")"
if ! [[ "$version" =~ ^(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)$ ]]; then
  echo "error: VERSION '$version' is not MAJOR.MINOR.PATCH" >&2
  exit 1
fi

tag="v$version"
sha="${GITHUB_SHA:-$(git rev-parse HEAD)}"

if [ "${PUSH:-1}" = "1" ]; then
  git fetch --tags --quiet origin
fi

if git rev-parse -q --verify "refs/tags/$tag" >/dev/null; then
  echo "Tag $tag already exists; nothing to do."
  exit 0
fi

git tag -a "$tag" "$sha" -m "Release $tag"
echo "Created tag $tag on $sha"

if [ "${PUSH:-1}" = "1" ]; then
  git push origin "refs/tags/$tag"
  echo "Pushed tag $tag"
fi
