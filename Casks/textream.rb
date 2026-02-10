cask "textream" do
  version "1.3.3"
  sha256 "94f07f044c3218735b45813733cc14e55948b7fe7d3f3ad66a862dfb54240850"

  url "https://github.com/f/textream/releases/download/v1.3.3/Textream.dmg"
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
