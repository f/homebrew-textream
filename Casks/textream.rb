cask "textream" do
  version "1.7.1"

  on_sequoia do
    sha256 "11a7d7d3f6bf1d57f68e834e3e573cf9210d0f435f0660d3fd1db1e71ad7d9c7"
    url "https://github.com/f/textream/releases/download/v#{version}/Textream-macos15.dmg"
  end

  on_tahoe :or_newer do
    sha256 "b1225e2df372558cec5d7e42095b70e91249cb7898ef4a12ff6013f02a4d15b9"
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
