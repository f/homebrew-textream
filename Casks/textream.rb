cask "textream" do
  version "1.5.1"

  if MacOS.version >= :tahoe
    sha256 "111cbdb37c74e0f414a4d155952c69096e760b7915d1efe1639203ee982f988f"
    url "https://github.com/f/textream/releases/download/v1.5.1/Textream.dmg"
  else
    sha256 "cea8beac1e458ad11f958808f72f2700d8393a64cbdb61746f5957fb6046fdff"
    url "https://github.com/f/textream/releases/download/v1.5.1/Textream-macos15.dmg"
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
