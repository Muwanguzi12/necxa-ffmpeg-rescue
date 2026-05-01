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

## ✅ What This Project Does

This repository uses **GitHub Actions** (free cloud servers) to automatically:
1. Clone the original FFmpeg + FFmpegKit C++ source code
2. Compile it using strict `min-gpl` rules (stripping out x264, x265, xvid and other heavy codecs your app doesn't need)
3. Package the result into a clean, lightweight **~10MB `.aar`** file
4. Publish it as a **public GitHub Release** so any developer in the world can download it instantly

**Result: Your APK goes from 108MB back down to ~27MB.**

---

## 📦 How to Use

### Option A — Manual (Direct Download)
1. Go to the [**Releases**](https://github.com/Muwanguzi12/necxa-ffmpeg-rescue/releases) tab.
2. Download `ffmpeg-kit-min-gpl-6.0.3.aar`.
3. Drop it into your project's `android/app/libs/` folder.
4. In `android/app/build.gradle`:
```gradle
dependencies {
    implementation(files("libs/ffmpeg-kit-min-gpl-6.0.3.aar"))
}
```

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

## 📜 License

This project inherits the licensing of the original FFmpegKit source code:
- FFmpeg core: **LGPL v2.1+** (with GPL components enabled under `min-gpl`)
- FFmpegKit wrapper: **LGPL v3**

See the original [FFmpegKit license](https://github.com/arthenica/ffmpeg-kit/blob/main/LICENSE) for full details.

---

*Built by developers, for developers. 🌍*
