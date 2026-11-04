cask "lost-and-prompt" do
  version "0.6.1"
  sha256 "d5c6f68fc76a68e1faa42eb593b6bf38dd155f85a122099c8982b67963e48385"

  url "https://github.com/axchisan/lost-and-prompt/releases/download/v#{version}/LostAndPrompt-#{version}-macos-universal.dmg"
  name "Lost & Prompt"
  desc "Find, organize and resume all your Claude Code sessions"
  homepage "https://github.com/axchisan/lost-and-prompt"

  auto_updates true
  depends_on macos: :sequoia

  app "Lost & Prompt.app"

  # La app no está notarizada (sin cuenta de Apple Developer): se quita la cuarentena para
  # que macOS no la bloquee al abrirla por primera vez.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Lost & Prompt.app"]
  end

  zap trash: [
    "~/Library/Application Support/LostAndPrompt",
    "~/Library/Preferences/com.axchisan.LostAndPrompt.plist",
    "~/.warp/tab_configs/lost_and_prompt.toml",
  ]
end
