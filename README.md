# OverTerm tap

Homebrew tap for [OverTerm](https://github.com/egeyesss/overterm), an
agent-aware floating terminal.

```sh
brew install --cask --no-quarantine egeyesss/overterm/overterm
```

The app is not signed with an Apple Developer certificate yet, so macOS
refuses to open it and reports that the developer cannot be verified.
`--no-quarantine` tells Homebrew to skip attaching the attribute that
triggers that check.
