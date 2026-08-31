cask "overterm" do
  version "1.0.3"
  sha256 "28ff4e061e10aa0955c7086d2d20bf6658452762b10ef448a318cdd7c71146f3"

  url "https://github.com/egeyesss/overterm/releases/download/v#{version}/oTerm_#{version}_universal.dmg"
  name "OverTerm"
  desc "Agent-aware floating terminal"
  homepage "https://github.com/egeyesss/overterm"

  depends_on macos: :big_sur

  app "oTerm.app"

  # Removing the app leaves what it wrote into other tools' config
  # behind, because macOS runs none of the app's own code when it goes.
  # This asks it to clean up first: the Claude Code hook entries and the
  # Pi extension both go. The flag is still named after the hooks, which
  # were all it did when it was added. must_succeed is false so a problem
  # there can never stop someone uninstalling.
  uninstall quit:   "io.github.egeyesilyurt.overterm",
            script: {
              executable:   "#{appdir}/oTerm.app/Contents/MacOS/overterm",
              args:         ["--uninstall-hooks"],
              must_succeed: false,
            }

  zap trash: "~/.config/overterm"
end
