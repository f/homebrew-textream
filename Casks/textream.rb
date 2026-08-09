cask "textream" do
  version "1.6.4"

  on_sequoia do
    sha256 "c08787ceff23e913e527c7bc51c87966a0475db085c2a50183b61b4fd43a5c0a"
    url "https://github.com/f/textream/releases/download/v#{version}/Textream-macos15.dmg"
  end

  on_tahoe :or_newer do
    sha256 "806baf267290bfbf0bc86f428a827b6aabaf846c91047b2733a680b7f74b5407"
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
