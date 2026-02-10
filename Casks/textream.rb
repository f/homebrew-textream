cask "textream" do
  version "1.3.5"
  sha256 "33b80a101ca621d1bbd480c716a79e8945c1f92afb76bd7250ba8bc7342ff2e9"

  url "https://github.com/f/textream/releases/download/v1.3.5/Textream.dmg"
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
