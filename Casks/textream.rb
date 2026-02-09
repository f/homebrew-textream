cask "textream" do
  version "1.3.1"
  sha256 "d708a2f6a2926dc0743a545227edeccfa752cd7b72b2e8701220a859bae96ada"

  url "https://github.com/f/textream/releases/download/v1.3.1/Textream.dmg"
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
