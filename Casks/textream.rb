cask "textream" do
  version "1.6.5"

  on_sequoia do
    sha256 "4e63b32d6925ef375676c466d32734b8af925aeb66683205e2df4bc8342a8604"
    url "https://github.com/f/textream/releases/download/v#{version}/Textream-macos15.dmg"
  end

  on_tahoe :or_newer do
    sha256 "d007423a1bbd65b95e5ad9b2ffb29fb6a5004a55389991c523875b16edc01570"
    url "https://github.com/f/textream/releases/download/v#{version}/Textream.dmg"
  end

  name "Textream"
  desc "Teleprompter that highlights scripts in real time as you speak"
  homepage "https://github.com/f/textream"

  depends_on macos: :sequoia

  app "Textream.app"

  zap trash: [
    "~/Library/Preferences/dev.fka.textream.plist",
    "~/Library/Saved Application State/dev.fka.textream.savedState",
  ]
end
