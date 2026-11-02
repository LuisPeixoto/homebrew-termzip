cask "termzip" do
  arch arm: "aarch64", intel: "x64"

  version "0.5.0"
  sha256 arm:   "01011e8c4b7c5c14687e83c9fe138ac735f5116874e3a201ce66dddd56283745",
         intel: "4f38bf31c9218811ba6a011a5cdc35f0092c1dada78cb4aa0af93dc9938aa80c"

  url "https://github.com/LuisPeixoto/TermZip/releases/download/v#{version}/TermZip_#{version}_#{arch}.dmg"
  name "TermZip"
  desc "Terminal with command blocks, split panes and a WebAssembly plugin sandbox"
  homepage "https://github.com/LuisPeixoto/TermZip"

  depends_on macos: ">= :catalina"

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
