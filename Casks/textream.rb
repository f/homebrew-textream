cask "textream" do
  version "1.2.4"
  sha256 "0aafccd72d42fd19411ea28989917b91b3ebcb9b0db01d998c4bfaaac8c2c6ec"

  url "https://github.com/f/textream/releases/download/v1.2.4/Textream.dmg"
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
