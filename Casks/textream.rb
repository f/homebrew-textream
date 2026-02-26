cask "textream" do
  version "1.4.2"

  if MacOS.version >= :tahoe
    sha256 "75c33288844e0f893ab20c2263460a12292f43cf322cc1d7e53c7cc65818500e"
    url "https://github.com/f/textream/releases/download/v1.4.2/Textream.dmg"
  else
    sha256 "482e80a59cb1b84622c4de302fc9d24209c8dcbbc6d6f0d1ced916068f64f2be"
    url "https://github.com/f/textream/releases/download/v1.4.2/Textream-macos15.dmg"
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
