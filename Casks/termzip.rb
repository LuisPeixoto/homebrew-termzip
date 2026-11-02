cask "termzip" do
  arch arm: "aarch64", intel: "x64"

  version "1.0.0"
  sha256 arm:   "80e3e625145bcfca792bc3a4768406b652fee81561704fec1fb4501ac03e8ec0",
         intel: "ef19118f2f8004bf2ba556bd89b7ac09f3bfa68c09e896e760831d3a79bf06b9"

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
