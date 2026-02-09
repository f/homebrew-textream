cask "textream" do
  version "1.3.2"
  sha256 "d31e84ef91b8e186b31f745e6aed91f723122d6f443e1df270b5130df681a6c7"

  url "https://github.com/f/textream/releases/download/v1.3.2/Textream.dmg"
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
