# Homebrew cask of Sextant, rendered by scripts/packaging.mjs from a published release (ADR-0104).
# Do not edit the copy in the tap by hand: the release workflow overwrites it.
cask "sextant" do
  version "0.25.2"
  sha256 "8ce292902ffd8cff4f5e4f241a8af49aaddebc53bf401694d77b8328f03c34fa"

  url "https://github.com/FriendsOfKubernetes/sextant/releases/download/v#{version}/Sextant_#{version}_universal.dmg"
  name "Sextant"
  desc "Desktop Kubernetes client with a built-in MCP server for AI agents"
  homepage "https://github.com/FriendsOfKubernetes/sextant"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app replaces itself from the release's signed update (Settings -> Updates).
  auto_updates true

  app "Sextant.app"

  zap trash: [
    "~/Library/Application Support/dev.sextant.app",
    "~/Library/Caches/dev.sextant.app",
    "~/Library/HTTPStorages/dev.sextant.app",
    "~/Library/Logs/dev.sextant.app",
    "~/Library/Preferences/dev.sextant.app.plist",
    "~/Library/Saved Application State/dev.sextant.app.savedState",
    "~/Library/WebKit/dev.sextant.app",
  ]

  caveats <<~EOS
    Sextant is not signed with an Apple Developer ID, so macOS blocks its first start.
    Open it once from System Settings -> Privacy & Security -> Open Anyway, or run:
      xattr -dr com.apple.quarantine "#{appdir}/Sextant.app"
    See https://github.com/FriendsOfKubernetes/sextant/wiki/Installation
  EOS
end
