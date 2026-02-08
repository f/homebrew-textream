cask "textream" do
  version "1.0.1"
  sha256 "053d3759fb9c8dbecd920e2485626e8f9e20ffd3d208028d6f9f60090a0c6fdd"

  url "https://github.com/f/textream/releases/download/v1.0.1/Textream.dmg"
  name "Textream"
  desc "macOS teleprompter that highlights your script in real-time as you speak"
  homepage "https://github.com/f/textream"

  depends_on macos: ">= :sonoma"

  app "Textream.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/Textream.app"]
  end

  zap trash: [
    "~/Library/Preferences/dev.fka.Textream.plist",
    "~/Library/Saved Application State/dev.fka.Textream.savedState",
  ]
end
