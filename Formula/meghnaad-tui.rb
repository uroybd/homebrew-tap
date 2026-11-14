class MeghnaadTui < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.62"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.62/meghnaad-tui-0.6.62-aarch64-apple-darwin.tar.gz"
      sha256 "efe797fbb8d2ebeb062f63606d28392949c00ad6c5b2f9bca99aab8941e203e4"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.62/meghnaad-tui-0.6.62-x86_64-apple-darwin.tar.gz"
      sha256 "922bf8d7a7347494dced7977b7a54cc2cbc7abde6208e54c3e0647d3fc7b6a9f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.62/meghnaad-tui-0.6.62-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f1b2a61e5e253cd3b172bfd3dc3cfae16b182e9d769c51e38e5d2bd782eb3a7d"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.62/meghnaad-tui-0.6.62-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "48b53cb4de72e3532d0f5a486b7d30167cd9bbf7a0e9547610cbc676d740d18b"
    end
  end

  def install
    bin.install "meghnaad-tui"
  end

  def caveats
    <<~EOS
      Run meghnaad-tui: it works on the tasks task reads. Its task commands are kept in
      settings.json in $MEGHNAAD_CONFIG_DIR, else ~/.config/meghnaad.
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.62/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad-tui --help")
  end
end
