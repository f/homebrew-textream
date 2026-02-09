cask "textream" do
  version "1.2.0"
  sha256 "39f501ec4515b8ccf04a8944d15d0553785f3ed433755ebc60fe561789cd4f70"

  url "https://github.com/f/textream/releases/download/v1.2.0/Textream.dmg"
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
