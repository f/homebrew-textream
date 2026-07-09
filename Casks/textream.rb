cask "textream" do
  version "1.6.2"

  if MacOS.version >= :tahoe
    sha256 "c6b41e0855f621db40b66a0491bc079d0a17f0c7f938bf3fd5d322b7ecacaf60"
    url "https://github.com/f/textream/releases/download/v#{version}/Textream.dmg"
  else
    sha256 "5e275f740073a5af0bb9c1225744edbc7614e99c55469b9b91373698d58eceb3"
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
