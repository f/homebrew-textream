cask "textream" do
  version "1.1.1"
  sha256 "19d209b077c32d36fe5b4233e858a1a8f7ecdc053bc37b37d5f6c6c437ce0780"

  url "https://github.com/f/textream/releases/download/v1.1.1/Textream.dmg"
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
