cask "textream" do
  version "1.3.0"
  sha256 "31a253c606f58ab815675cc9521ed43a55b7601afa1bc57dbfb89130c58cc27d"

  url "https://github.com/f/textream/releases/download/v1.3.0/Textream.dmg"
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
