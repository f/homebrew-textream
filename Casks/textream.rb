cask "textream" do
  version "1.2.1"
  sha256 "80a077e9c3f2ce5851eb942ef696edd8a0c9d3b8459b39b959770469521e421e"

  url "https://github.com/f/textream/releases/download/v1.2.1/Textream.dmg"
  name "Textream"
  desc "macOS teleprompter that highlights your script in real-time as you speak"
  homepage "https://github.com/f/textream"

  depends_on macos: ">= :sequoia"

  app "Textream.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/Textream.app"]
  end

  zap trash: [
    "~/Library/Preferences/dev.fka.Textream.plist",
    "~/Library/Saved Application State/dev.fka.Textream.savedState",
  ]
end
