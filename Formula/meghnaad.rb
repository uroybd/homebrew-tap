class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.48"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.48/meghnaad-0.8.48-aarch64-apple-darwin.tar.gz"
      sha256 "ee93bc6175b65f11c2b13717c3f439f5702e5f18c8074894c9d2e76fd99a49e5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.48/meghnaad-0.8.48-x86_64-apple-darwin.tar.gz"
      sha256 "39f8b0a1e21b57767381d0a94f7f3ab94a4bf0ead31310eb05132fff3c03b222"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.48/meghnaad-0.8.48-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "69080c062fc6097df539920e89817411398ac9a5f32a3faf111dc55f5093dd62"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.48/meghnaad-0.8.48-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "22505c8cd39ffa2b49f4620f7089fe7bf1dc26c4a64eba0f1b2fe20c4862f0e7"
    end
  end

  def install
    bin.install "meghnaad"
    bin.install_symlink "meghnaad" => "meghnaad-tui"
  end

  def caveats
    <<~EOS
      Run meghnaad: it works on the tasks task reads. Its task commands are kept in
      settings.json in $MEGHNAAD_CONFIG_DIR, else ~/.config/meghnaad.
      meghnaad-tui, its old name, still runs it for now.
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.48/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
