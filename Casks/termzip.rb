cask "termzip" do
  arch arm: "aarch64", intel: "x64"

  version "1.0.1"
  sha256 arm:   "d0379fa191c3ba37be071163dee43756f70ccde97fdb2153b717438b6ef8b3ae",
         intel: "77341334c3c847708c1ff8d0b90241fcdc15ce3263610432e228069124228d22"

  url "https://github.com/LuisPeixoto/TermZip/releases/download/v#{version}/TermZip_#{version}_#{arch}.dmg"
  name "TermZip"
  desc "Terminal with command blocks, split panes and a WebAssembly plugin sandbox"
  homepage "https://github.com/LuisPeixoto/TermZip"

  depends_on :macos

  app "TermZip.app"

  zap trash: [
    "~/Library/Application Support/termzip",
    "~/Library/Caches/dev.termzip.app",
    "~/Library/WebKit/dev.termzip.app",
  ]

  caveats <<~EOS
    TermZip is not signed with an Apple Developer ID or notarized yet, so macOS may refuse to open it the first time.
    Open it with a right-click (Control-click) on the app, then Open, or allow it in System Settings, Privacy and
    Security.
  EOS
end
