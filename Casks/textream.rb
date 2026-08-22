cask "textream" do
  version "1.7.0"

  on_sequoia do
    sha256 "fdab38b38057290fe212b550e87668819bf345bc6fe4d7afcaf5095eb9759a84"
    url "https://github.com/f/textream/releases/download/v#{version}/Textream-macos15.dmg"
  end

  on_tahoe :or_newer do
    sha256 "ba88abcfbf27af0956297c6b5a6acae416c1791a9927fd7795df9b1dd9fe064c"
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
