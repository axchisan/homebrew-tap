cask "lost-and-prompt" do
  version "0.7.0"
  sha256 "be271769c13de73140eb8216d27dbb20780b6abe75cc75ed03b7100f48ed1222"

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
