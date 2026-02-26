cask "textream" do
  version "1.4.3"

  if MacOS.version >= :tahoe
    sha256 "c91e371743d5e1f5828f4fb8f0f106a77a66a42f0cf38724fd6bb3abb7e9380c"
    url "https://github.com/f/textream/releases/download/v1.4.3/Textream.dmg"
  else
    sha256 "f9571d04e7be2cb9672854539e756bec1844c4fe785549c4c1b89af6dc51e691"
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
