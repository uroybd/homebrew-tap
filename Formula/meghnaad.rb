class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.33"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.33/meghnaad-0.8.33-aarch64-apple-darwin.tar.gz"
      sha256 "5563e40f5b9f91736974c6ffe188a09e14ee699357bf081a3e1399c1bce98a34"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.33/meghnaad-0.8.33-x86_64-apple-darwin.tar.gz"
      sha256 "2d034971e5751b4a534b95599fb8d73ee600a4f30525fd341baad6bf0b6eb4a0"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.33/meghnaad-0.8.33-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8da24815acc1898c8fcb968b80b4ce01b69959e2f1c046743cae11988a9edca3"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.33/meghnaad-0.8.33-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "028058358ddd4191eed5b9b10704ce15f5fe3ab6a91a427e27d06c9c8335cbf6"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.33/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
