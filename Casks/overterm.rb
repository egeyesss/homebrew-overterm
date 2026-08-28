cask "overterm" do
  version "0.2.0"
  sha256 "a2aeaa40bcca795d6978828da48a1d4ee4aca6787a35fbf589fbbec80adba6c1"

  url "https://github.com/egeyesss/overterm/releases/download/v#{version}/OverTerm_#{version}_universal.dmg"
  name "OverTerm"
  desc "Agent-aware floating terminal"
  homepage "https://github.com/egeyesss/overterm"

  depends_on macos: :big_sur

  app "OverTerm.app"

  # Removing the app leaves its Claude Code hook entries behind, because
  # macOS runs none of the app's own code when it goes. This asks it to
  # clean up first. must_succeed is false so a problem there can never
  # stop someone uninstalling.
  uninstall quit:   "io.github.egeyesilyurt.overterm",
            script: {
              executable:   "#{appdir}/OverTerm.app/Contents/MacOS/overterm",
              args:         ["--uninstall-hooks"],
              must_succeed: false,
            }

  zap trash: "~/.config/overterm"
end
