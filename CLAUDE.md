# CLAUDE.md — Time Stretch Module

External tool module for Move Everything. Real-time audio time stretching using Bungee.

## Module Structure

```
src/
  module.json       # Module metadata (component_type: "tool", interactive)
  ui.js             # QuickJS UI (menu, save prompt, file browser)
  dsp.so            # Bungee-based DSP plugin (pre-built ARM64)
  help.json         # On-device help content
```

## Build & Deploy

```bash
./scripts/build.sh        # Package to dist/stretch/
./scripts/install.sh      # Deploy to Move device
```

No cross-compilation needed — ships pre-built binaries.

## Release

1. Update version in `src/module.json`
2. `git commit -am "bump to vX.Y.Z"`
3. `git tag vX.Y.Z && git push --tags`
4. GitHub Actions builds and creates release

## How It Works

This is an interactive tool — the shadow UI loads the DSP and UI together.
- DSP loads the WAV file and stretches it in real-time based on target BPM
- UI provides menu for Bars, Target BPM, and Save options
- Pads toggle audio playback
- Save renders the full stretched output to a new WAV file
