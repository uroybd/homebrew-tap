class MeghnaadTui < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.70"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.70/meghnaad-tui-0.6.70-aarch64-apple-darwin.tar.gz"
      sha256 "8d7d36f1dcd147a6c8c811529c8860d3dfb86b5ce201ac4014feb0bae0763c51"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.70/meghnaad-tui-0.6.70-x86_64-apple-darwin.tar.gz"
      sha256 "df0c752a078c5a592a38ecba04f90f76f7977fa504fc577076eecbaf632820a1"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.70/meghnaad-tui-0.6.70-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "069ab33e82ba94977058f7086065420a4bbd69fdc5592d1e3af398e906fffa3b"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.70/meghnaad-tui-0.6.70-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d7bc685083bad83fc6eb191396ff6e651277074ce3e06226581b10f6bb861df9"
    end
  end

  def install
    bin.install "meghnaad-tui"
  end

  def caveats
    <<~EOS
      Run meghnaad-tui: it works on the tasks task reads. Its task commands are kept in
      settings.json in $MEGHNAAD_CONFIG_DIR, else ~/.config/meghnaad.
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.70/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad-tui --help")
  end
end
