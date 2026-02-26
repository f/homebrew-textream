cask "textream" do
  version "1.5.0"

  if MacOS.version >= :tahoe
    sha256 "ce35870e541b4e8d29b75a7046fb9bd3430b1cdb1a92dad535dff55aa798fc61"
    url "https://github.com/f/textream/releases/download/v1.5.0/Textream.dmg"
  else
    sha256 "13a39e8df3f377af92a779265e4926f796e60f1e500a47d6e93f2c1e3a5046c0"
    url "https://github.com/f/textream/releases/download/v1.5.0/Textream-macos15.dmg"
  end

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
