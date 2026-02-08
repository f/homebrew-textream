cask "textream" do
  version "1.1.0"
  sha256 "f556cc092f85186767559832d9809bb97004f33cffff2890e8ee10cc73f957b6"

  url "https://github.com/f/textream/releases/download/v1.1.0/Textream.dmg"
  name "Textream"
  desc "macOS teleprompter that highlights your script in real-time as you speak"
  homepage "https://github.com/f/textream"

  depends_on macos: ">= :sonoma"

  app "Textream.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/Textream.app"]
  end

  zap trash: [
    "~/Library/Preferences/dev.fka.Textream.plist",
    "~/Library/Saved Application State/dev.fka.Textream.savedState",
  ]
end
