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

# This is a binary-symbol/string presence check, not proof that a filter
# successfully processes media. Runtime smoke tests are still required on
# Android against real sample assets.
required=(
  libx264
  fontconfig
  freetype
  libass
  fribidi
  drawtext
  subtitles
  chromakey
  overlay
  xfade
  amix
  acrossfade
  areverse
  atempo
  atrim
  adelay
  afade
  aresample
  aformat
  alimiter
  scale
  crop
  transpose
  reverse
  eq
  unsharp
  smartblur
)

for capability in "${required[@]}"; do
  if ! grep -Fq "$capability" "$ALL_STRINGS"; then
    echo "FAIL: required FFmpeg capability marker not found in native libraries: $capability" >&2
    exit 1
  fi
  echo "PASS: marker $capability"
done

echo "PASS: AAR contains ${#NATIVE_LIBS[@]} native libraries and arm64-v8a support."
echo "NOTE: Android media-processing smoke tests are still required."
