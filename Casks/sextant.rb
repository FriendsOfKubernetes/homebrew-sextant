# Homebrew cask of Sextant, rendered by scripts/packaging.mjs from a published release (ADR-0104).
# Do not edit the copy in the tap by hand: the release workflow overwrites it.
cask "sextant" do
  version "0.25.3"
  sha256 "f35c0f21d27d715a68a5272c006093da30e8a656df2b00a791f113ad13a65dcf"

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
