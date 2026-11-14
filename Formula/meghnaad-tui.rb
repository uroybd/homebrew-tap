class MeghnaadTui < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.64"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.64/meghnaad-tui-0.6.64-aarch64-apple-darwin.tar.gz"
      sha256 "ef92dc58e89af2332c4861773ebe7bfbaa8beae90b2f42c57f75faa0c48bc3ad"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.64/meghnaad-tui-0.6.64-x86_64-apple-darwin.tar.gz"
      sha256 "2af3db841c7a84c9e168b519bdb5fee38e1dec0959504592455b50db916ed8ab"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.64/meghnaad-tui-0.6.64-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "21fd01524678a25e39714b0867fb40ea2e550730bb37f2abb913671cfaf7e318"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.64/meghnaad-tui-0.6.64-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d5815d42ef282d8d5f1696343300b6240ca0b6b028d9c28c5950408f2db0cbab"
    end
  end

  def install
    bin.install "meghnaad-tui"
  end

  def caveats
    <<~EOS
      Run meghnaad-tui: it works on the tasks task reads. Its task commands are kept in
      settings.json in $MEGHNAAD_CONFIG_DIR, else ~/.config/meghnaad.
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.64/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad-tui --help")
  end
end
