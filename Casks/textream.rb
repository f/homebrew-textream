cask "textream" do
  version "1.6.3"

  if MacOS.version >= :tahoe
    sha256 "194b0b9ffd4a6859d9ed2b1c8117fe941628516414e9afe5132d22c341d08545"
    url "https://github.com/f/textream/releases/download/v#{version}/Textream.dmg"
  else
    sha256 "26a107b0cf6fe2b665daa91eba5f3278cadd308dd65489f11fe3b85ee1d18c08"
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
