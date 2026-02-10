cask "textream" do
  version "1.3.4"
  sha256 "f4d7cfce85425614ecb0cf5e8f5aed9343b67176893381d4ff92f479467923dd"

  url "https://github.com/f/textream/releases/download/v1.3.4/Textream.dmg"
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
