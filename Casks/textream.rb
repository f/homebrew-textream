cask "textream" do
  version "1.4.0"
  sha256 "f886f6f90c69726703f5c750b6a289cfd9a0a8305b2049875943086c2067504b"

  url "https://github.com/f/textream/releases/download/v1.4.0/Textream.dmg"
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
