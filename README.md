# 🎬 FFmpegKit Rescue Project

[![Build min-gpl AAR](https://github.com/Muwanguzi12/necxa-ffmpeg-rescue/actions/workflows/build-min-gpl.yml/badge.svg)](https://github.com/Muwanguzi12/necxa-ffmpeg-rescue/actions/workflows/build-min-gpl.yml)
[![License: LGPL v3](https://img.shields.io/badge/License-LGPL_v3-blue.svg)](https://www.gnu.org/licenses/lgpl-3.0)
[![GitHub Release](https://img.shields.io/github/v/release/Muwanguzi12/necxa-ffmpeg-rescue)](https://github.com/Muwanguzi12/necxa-ffmpeg-rescue/releases)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)

> **Community rescue fork** — lightweight, pre-compiled `ffmpeg-kit-min-gpl` Android AAR binaries, automatically built via GitHub Actions CI/CD. Free to use, free to contribute.

---

## 🚨 Why This Exists

In early 2025, the official `arthenica/ffmpeg-kit` project was **permanently retired** without warning. All pre-compiled `.aar` binaries — including the widely used lightweight `min-gpl` variant — were **deleted from the internet**.

This broke the build pipelines of **thousands of Flutter and Android apps worldwide**, forcing developers to either:
- ❌ Abandon FFmpeg entirely
- ❌ Ship a bloated **108MB** `full-gpl` binary they don't need
- ❌ Attempt to compile FFmpeg C++ from scratch on Windows (nearly impossible)

This project was created to end that nightmare.

---

## What this build contains

The repository builds a **Necxa Studio editor profile** of FFmpegKit for Android. It stays separate from the Necxa Flutter application and publishes a reusable AAR.

The profile is deliberately focused on the operations the media editor actually calls:

| Capability | Native component |
|---|---|
| H.264 export used by the editor | `libx264` encoder |
| Text overlays and imported fonts | FFmpeg `drawtext`, FreeType, Fontconfig |
| Styled subtitle rendering | `subtitles` filter, libass, FriBidi |
| Hardware codec integration | Android MediaCodec |
| Timeline composition | Built-in FFmpeg filters: `overlay`, `chromakey`, `xfade`, `amix`, `acrossfade` |
| Audio operations | Built-in filters: `areverse`, `atempo`, `aresample` |

The timeline and composition filters are part of FFmpeg itself; they are verified in the resulting native libraries rather than treated as separate external codec packages.

### Build source

The workflow uses the maintained FFmpegKit 6.0 LTS source tree from [ffmpegkit-maintained/ffmpeg](https://github.com/ffmpegkit-maintained/ffmpeg), pinned to a specific commit for reproducible builds. The workflow enables only the external libraries required by this editor profile rather than enabling every optional library.

AAR size depends on the selected libraries and Android ABIs. The previous release artifact was about 36.8 MB, so the old ~10 MB claim was inaccurate and has been removed.

---

## 📦 How to Use

### Option A — Manual (Direct Download)
1. Open the [**Releases**](https://github.com/Muwanguzi12/necxa-ffmpeg-rescue/releases) tab.
2. Download `ffmpeg-kit-min-gpl-6.0.3.aar`.
3. Place it in `android/app/libs/`.
4. Keep the filename exactly as shown because the Necxa app's Gradle configuration references it:
```kotlin
dependencies {
    implementation(files("libs/ffmpeg-kit-min-gpl-6.0.3.aar"))
}
```

The release also includes `BUILD_INFO.txt` and `SHA256SUMS.txt`. Verify the checksum before replacing the app's current AAR.

### Option B — JitPack (Auto-Resolve)
```gradle
// android/build.gradle
repositories {
    maven { url 'https://jitpack.io' }
}

// android/app/build.gradle
dependencies {
    implementation 'com.github.Muwanguzi12:necxa-ffmpeg-rescue:v6.0.3'
}
```

---

## 🔧 Compatibility

| Platform | Status |
|----------|--------|
| Android arm64-v8a | ✅ Supported |
| Android armeabi-v7a | ✅ Supported |
| Android x86_64 | ✅ Supported |
| Flutter (Android) | ✅ Supported |
| React Native (Android) | ✅ Supported |
| iOS | 🔜 Community contribution welcome |

---

## 🤝 Contributing

This project belongs to the community. If you can:
- Optimize the build flags to squeeze the AAR smaller
- Add iOS xcframework support
- Fix a bug or improve the pipeline

...your Pull Request is **very welcome**. See [CONTRIBUTING.md](CONTRIBUTING.md) for how to get started.

---

## 🏆 Project Initiator & Credits

This rescue initiative was **sparked, conceptualized, and initiated** by **Muwanguzi Samson** — a developer who refused to accept that the entire mobile development community should be held hostage by a single retired repository.

If this project saved your build pipeline, reduced your APK size, or just gave you back your sanity — show some love:

| Method | Details |
|--------|---------|
| 📧 Email | knestars@gmail.com |
| 📱 Mobile Money / Wave / Flutterwave | +256787798570 |

---

## License and distribution warning

This editor profile enables `--enable-gpl` and the GPL-licensed `x264` encoder. The resulting native package is **GPL-3.0**, not an LGPL-only binary.

Bundling a GPL-3.0 FFmpegKit binary into a distributed application can impose source-distribution and licensing obligations on the combined work. Do not assume a proprietary application can ship this profile unchanged. Review the applicable licenses and obtain qualified legal advice before distributing it.

The FFmpegKit wrapper and each external library retain their own notices. See the upstream source and bundled license files for the exact component terms.

---

*Built by developers, for developers. 🌍*
