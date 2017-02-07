# MacVoikko

## Requirements

- Xcode
- automake
- autoconf
- libtool
- pkg-config
- python3
- gettext
- cmake

## Building

Run the following commands:

```bash
carthage bootstrap --platform macOS --no-use-binaries
git submodule update --init
```

Then, open Xcode and build. Easy.

## Installing

Pop into `~/Library/Services`.
