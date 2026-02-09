cask "textream" do
  version "1.2.3"
  sha256 "c0370bc47bb9e578b7824c113780cc1665af854dd4099ca19a685868ce7bba5b"

  url "https://github.com/f/textream/releases/download/v1.2.3/Textream.dmg"
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
