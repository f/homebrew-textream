cask "textream" do
  version "1.8.0"

  on_sequoia do
    sha256 "cdb17a19f7cb8ef8fa7501e2df72aa14c7e75d496b8823c04923226124a46142"
    url "https://github.com/f/textream/releases/download/v#{version}/Textream-macos15.dmg"
  end

  on_tahoe :or_newer do
    sha256 "7b9fbaee3554f9ecc47f86d5a7044a093006228efa62aafedd5255392a60d8a2"
    url "https://github.com/f/textream/releases/download/v#{version}/Textream.dmg"
  end

  name "Textream"
  desc "Teleprompter that highlights scripts in real time as you speak"
  homepage "https://textream.net/"

  depends_on macos: :sequoia

  app "Textream.app"

  zap trash: [
    "~/Library/Preferences/dev.fka.textream.plist",
    "~/Library/Saved Application State/dev.fka.textream.savedState",
  ]
end
