#!/usr/bin/env bash
# Concatenate every .crt (PEM) in a folder into a single CA roots file.
# Usage: ./build-roots.sh -in <folder> -out <file>
set -euo pipefail

usage() {
  echo "usage: $0 -in <folder> -out <file>" >&2
  exit 1
}

in=""
out=""
while [ $# -gt 0 ]; do
  case "$1" in
    -in)  [ $# -ge 2 ] || usage; in="$2"; shift 2 ;;
    -out) [ $# -ge 2 ] || usage; out="$2"; shift 2 ;;
    *)    usage ;;
  esac
done
[ -n "$in" ] && [ -n "$out" ] || usage

mkdir -p "$(dirname "$out")"
find "$in" -iname '*.crt' -print0 | sort -z | xargs -0 cat > "$out"
