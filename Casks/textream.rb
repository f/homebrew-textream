cask "textream" do
  version "1.6.0"

  if MacOS.version >= :tahoe
    sha256 "1ca5479f1c3c21854caba293733d269713800f7ca8dfe5e89afa3b436528797b"
    url "https://github.com/f/textream/releases/download/v#{version}/Textream.dmg"
  else
    sha256 "821e11684cc6048ee138347670b4bde04648e0a5c55a389ea6417625d9b30e4a"
    url "https://github.com/f/textream/releases/download/v#{version}/Textream-macos15.dmg"
  end

  name "Textream"
  desc "macOS teleprompter that highlights your script in real-time as you speak"
  homepage "https://github.com/f/textream"

  depends_on macos: :sequoia

  app "Textream.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/Textream.app"]
  end

  zap trash: [
    "~/Library/Preferences/dev.fka.Textream.plist",
    "~/Library/Saved Application State/dev.fka.Textream.savedState",
  ]
end
