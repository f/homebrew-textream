cask "textream" do
  version "1.6.1"

  if MacOS.version >= :tahoe
    sha256 "8ad6f702821d07f7970998eb69dacb3ea1c8204d1d049dccbdbdd4b573cdd357"
    url "https://github.com/f/textream/releases/download/v#{version}/Textream.dmg"
  else
    sha256 "092187fca26383cda230905ff42c2a6ae4a70a503f356e93fe38d5ed2ee705fd"
    url "https://github.com/f/textream/releases/download/v#{version}/Textream-macos15.dmg"
  end

  name "Textream"
  desc "macOS teleprompter that highlights your script in real-time as you speak"
  homepage "https://github.com/f/textream"

  depends_on macos: :sequoia

  app "Textream.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/Textream.app"]
  end

  zap trash: [
    "~/Library/Preferences/dev.fka.Textream.plist",
    "~/Library/Saved Application State/dev.fka.Textream.savedState",
  ]
end
