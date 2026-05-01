# Contributing to FFmpegKit Rescue Project

All contributions are welcome! Here is how you can help:

## Ways to Contribute

### 1. Test the Builds
- Download a release AAR and drop it into your Flutter/Android project.
- Report your results (APK size before/after, any runtime issues) in GitHub Issues.

### 2. Improve the Build Script
- If you can optimize the `android.sh` flags to reduce the AAR size further, open a Pull Request.
- If you have experience with Android NDK cross-compilation, your expertise is invaluable.

### 3. Add CI Improvements
- Improve the GitHub Actions pipeline (e.g., caching NDK downloads, faster matrix builds).
- Add iOS support (macOS runner) to compile `.xcframework` bundles.

### 4. Documentation
- Improve usage instructions.
- Add integration guides for React Native, Expo, Kotlin Multiplatform.

## Code of Conduct
Be respectful. This is a community project born out of necessity. Everyone here is a volunteer.

## Getting Started
1. Fork this repository on GitHub.
2. Create a feature branch: `git checkout -b my-improvement`
3. Make your changes and commit: `git commit -m "Describe your change"`
4. Push to your fork: `git push origin my-improvement`
5. Open a Pull Request — the maintainer will review it.

---

*Project initiated by **Muwanguzi Samson** (knestars@gmail.com)*
