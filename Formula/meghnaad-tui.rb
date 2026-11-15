class MeghnaadTui < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.66"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.66/meghnaad-tui-0.6.66-aarch64-apple-darwin.tar.gz"
      sha256 "fa200e08188bea4772a5f9ef6fb4bb9007d3ecd4459ed5720acd8e493ca761cd"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.66/meghnaad-tui-0.6.66-x86_64-apple-darwin.tar.gz"
      sha256 "d0a19fd690c13faf9dd4af0f0da344c1046cf6d09c983e27f83569b4e0d6630e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.66/meghnaad-tui-0.6.66-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1379f15146666bdd8cc067661393118500ac92e0789d80232b720cd0c745ee19"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.66/meghnaad-tui-0.6.66-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e8618f3ecff688803ee8eead314d162e1a5e015a57c8188fd9e5e9d095d563c5"
    end
  end

  def install
    bin.install "meghnaad-tui"
  end

  def caveats
    <<~EOS
      Run meghnaad-tui: it works on the tasks task reads. Its task commands are kept in
      settings.json in $MEGHNAAD_CONFIG_DIR, else ~/.config/meghnaad.
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.66/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad-tui --help")
  end
end
