class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.2"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.2/meghnaad-0.8.2-aarch64-apple-darwin.tar.gz"
      sha256 "97fdf13dfd4cfe1d0a39407120b2b64d1d783b6492fd84f362071e0e1adc2b77"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.2/meghnaad-0.8.2-x86_64-apple-darwin.tar.gz"
      sha256 "2a93fe8f106e322083d6c4c216d053ae71185435aabc47c03ecd69c0af9d2370"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.2/meghnaad-0.8.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2e61c37886b4a9acec82222b59145a93bedb9f27e12027949866b7dbc040cba6"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.2/meghnaad-0.8.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "429ddc9b18b0997baab100165f0300cd33d56254c6deda144715729eba250432"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.2/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
