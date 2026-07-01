cask "textream" do
  version "1.5.2"

  if MacOS.version >= :tahoe
    sha256 "f96138afac50fc03ca9ced20a4fd5f3bb4c2ee9cd91635e2862eb4e2f1ec17b0"
    url "https://github.com/f/textream/releases/download/v1.5.2/Textream.dmg"
  else
    sha256 "93e75898a9c0bed94c839afde58315f199ddadde38da469b781820c4570334e0"
    url "https://github.com/f/textream/releases/download/v1.5.2/Textream-macos15.dmg"
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
