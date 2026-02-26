cask "textream" do
  version "1.4.2"

  on_system :mac, macos: :tahoe do
    sha256 "1e16228e6bcd83b892a3b27781dd5fe76af37a10c68c848557f2246dea67874a"
    url "https://github.com/f/textream/releases/download/v1.4.2/Textream.dmg"
  end

  on_system :mac, macos: :sequoia do
    sha256 "78c8df33c1e5ab7fb6f84caef04aa3e5f5f8c637e5cfeb555d15fc9b2942b983"
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
