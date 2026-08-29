cask "overterm" do
  version "1.0.1"
  sha256 "feb7b8c09cb917216d9ea088e60551647e5bf253efe9b8f926839140412427d8"

  url "https://github.com/egeyesss/overterm/releases/download/v#{version}/oTerm_#{version}_universal.dmg"
  name "OverTerm"
  desc "Agent-aware floating terminal"
  homepage "https://github.com/egeyesss/overterm"

  depends_on macos: :big_sur

  app "oTerm.app"

  # Removing the app leaves its Claude Code hook entries behind, because
  # macOS runs none of the app's own code when it goes. This asks it to
  # clean up first. must_succeed is false so a problem there can never
  # stop someone uninstalling.
  uninstall quit:   "io.github.egeyesilyurt.overterm",
            script: {
              executable:   "#{appdir}/oTerm.app/Contents/MacOS/overterm",
              args:         ["--uninstall-hooks"],
              must_succeed: false,
            }

  zap trash: "~/.config/overterm"
end
