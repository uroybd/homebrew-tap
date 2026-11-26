class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.71"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.71/meghnaad-0.8.71-aarch64-apple-darwin.tar.gz"
      sha256 "a1e7904bef025726f4d971f596e3544837a43cbb0f520d6409f37e05da44b0cb"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.71/meghnaad-0.8.71-x86_64-apple-darwin.tar.gz"
      sha256 "6279217dc4e86490926a831c83c863983773852ede7d05557d42b8afdfa1f472"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.71/meghnaad-0.8.71-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ffd2d03600281a2347e090de704a0afdc6be6271027a7ac691b65fb05cb6a87c"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.71/meghnaad-0.8.71-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4389a9188cc7410bc3a18fb824f9aa20cb9906bd491ab8c510725c499fe43b70"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.71/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
