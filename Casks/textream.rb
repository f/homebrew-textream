cask "textream" do
  version "1.0.0"
  sha256 "b7f97b24d18519c6a9d92906a156ff65021eca6c311cb650da08c12e10bb834a"

  url "https://github.com/f/textream/releases/download/v1.0.0/Textream.dmg"
  name "Textream"
  desc "macOS teleprompter that highlights your script in real-time as you speak"
  homepage "https://github.com/f/textream"

  depends_on macos: ">= :sonoma"

  app "Textream.app"

  zap trash: [
    "~/Library/Preferences/dev.fka.Textream.plist",
    "~/Library/Saved Application State/dev.fka.Textream.savedState",
  ]
end
