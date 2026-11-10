#!/usr/bin/env bash
set -euo pipefail

AAR_PATH="${1:-}"
if [[ -z "$AAR_PATH" || ! -f "$AAR_PATH" ]]; then
  echo "Usage: $0 path/to/ffmpeg-kit-min-gpl-6.0.3.aar" >&2
  exit 2
fi

command -v unzip >/dev/null
command -v strings >/dev/null

WORK_DIR="$(mktemp -d)"
trap 'rm -rf "$WORK_DIR"' EXIT
unzip -q "$AAR_PATH" -d "$WORK_DIR"

mapfile -t NATIVE_LIBS < <(find "$WORK_DIR" -type f -name '*.so' -print)
if [[ ${#NATIVE_LIBS[@]} -eq 0 ]]; then
  echo "FAIL: AAR contains no native shared libraries." >&2
  exit 1
fi

if [[ ! -d "$WORK_DIR/jni/arm64-v8a" ]]; then
  echo "FAIL: AAR does not contain the required arm64-v8a ABI." >&2
  exit 1
fi

ALL_STRINGS="$WORK_DIR/native-strings.txt"
: > "$ALL_STRINGS"
for library in "${NATIVE_LIBS[@]}"; do
  strings "$library" >> "$ALL_STRINGS"
done

required=(
  libx264
  drawtext
  subtitles
  chromakey
  overlay
  amix
  acrossfade
  xfade
  areverse
  atempo
)

for capability in "${required[@]}"; do
  if ! grep -Fq "$capability" "$ALL_STRINGS"; then
    echo "FAIL: required FFmpeg capability not found in native libraries: $capability" >&2
    exit 1
  fi
  echo "PASS: $capability"
done

echo "PASS: AAR contains ${#NATIVE_LIBS[@]} native libraries and arm64-v8a support."
