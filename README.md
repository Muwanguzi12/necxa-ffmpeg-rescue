# Necxa Studio FFmpegKit Build

[![Build Necxa Studio AAR](https://github.com/Muwanguzi12/necxa-ffmpeg-rescue/actions/workflows/build-min-gpl.yml/badge.svg)](https://github.com/Muwanguzi12/necxa-ffmpeg-rescue/actions/workflows/build-min-gpl.yml)
[![License: GPL-3.0](https://img.shields.io/badge/License-GPL--3.0-red.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![GitHub Release](https://img.shields.io/github/v/release/Muwanguzi12/necxa-ffmpeg-rescue)](https://github.com/Muwanguzi12/necxa-ffmpeg-rescue/releases)

> Independent Android FFmpegKit build project for Necxa Studio. The application consumes a verified AAR; native build configuration remains in this separate repository.

## Purpose

The project builds a focused Android FFmpegKit runtime for the operations used by Necxa's media editor. It does not replace the editor's Flutter timeline, preview, camera effects or GPU rendering systems.

## Target capabilities

| Capability | Required component |
|---|---|
| H.264 export | x264 encoder (libx264) |
| Text overlays | FFmpeg drawtext, FreeType and Fontconfig |
| Styled subtitle rendering | FFmpeg subtitles, libass and FriBidi |
| Android codec integration | MediaCodec support |
| Video composition | Built-in filters including overlay, chromakey and xfade |
| Audio composition | Built-in filters including amix, acrossfade, areverse, atempo and aresample |

These are target capabilities, not a claim that the current build has passed. The workflow must finish the native build, package the AAR and pass its capability checks before this profile can be treated as verified. A successful CI check is still followed by real Android device tests.

## Build source

The workflow pins a maintained FFmpegKit 6.0 LTS source commit from https://github.com/ffmpegkit-maintained/ffmpeg for reproducibility. It enables x264, Fontconfig and libass alongside Android MediaCodec and zlib.

AAR size depends on enabled libraries and ABIs. The earlier approximately 10 MB claim was inaccurate; a previous artifact was approximately 36.8 MB.

## Using the new build

**Do not replace the app's existing AAR with an older release asset.** The legacy release predates this Necxa Studio profile.

The new profile's AAR, build information and SHA-256 checksum will be attached to a release only after the build workflow passes and a new version is deliberately published. Until then, use the workflow artifact for controlled testing only.

When integrating a verified AAR, preserve the filename expected by Necxa's Gradle configuration and update both bundled AAR locations consistently. Verify its SHA-256 checksum before integration.

## ABI and platform support

Android ABI support is not declared as verified until the produced AAR is inspected and tested. The workflow currently requires arm64-v8a; other Android ABIs must be confirmed from the actual artifact. This repository's current profile is Android-only; iOS is not included.

## Licensing

This profile enables --enable-gpl and the GPL-licensed x264 encoder. The resulting FFmpeg build is GPL-3.0, not an LGPL-only binary.

Bundling a GPL-3.0 FFmpegKit binary into a distributed application can impose source-distribution and licensing obligations on the combined work. Do not assume a proprietary application can ship this profile unchanged. Review the applicable component licenses and obtain qualified legal advice before distributing it.

The FFmpegKit wrapper and each external library retain their own notices. Consult the upstream source and bundled license files for exact terms.
