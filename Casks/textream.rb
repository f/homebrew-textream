cask "textream" do
  version "1.4.3"

  if MacOS.version >= :tahoe
    sha256 "b98b6d1a378035a37e7e7beba826ea4ed4a25627cb27645f8b00fc588014b5ea"
    url "https://github.com/f/textream/releases/download/v1.4.3/Textream.dmg"
  else
    sha256 "8014fc1ad95174aef2eccb47aada0e2eb6fce880c686b920c6f91502ab77c530"
    url "https://github.com/f/textream/releases/download/v1.4.3/Textream-macos15.dmg"
  end

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
