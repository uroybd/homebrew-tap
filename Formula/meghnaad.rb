class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.8"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.8/meghnaad-0.8.8-aarch64-apple-darwin.tar.gz"
      sha256 "94440e8b55d964a34968ec67cb4c164704794432a801e80bee80d3e6b7325b17"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.8/meghnaad-0.8.8-x86_64-apple-darwin.tar.gz"
      sha256 "89bd16722d6cde563358773f73af9b0309237e422506aba02dc49e06ef9e7cfb"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.8/meghnaad-0.8.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "daae15d24b8cc6a1a6b0e5f27ed09762b2e58b7385503b5375d1ac3985521a1c"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.8/meghnaad-0.8.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8a314ad8cfd99c43c56fa4174d07ffd17022e94a69f194043a6f281d95387a58"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.8/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
