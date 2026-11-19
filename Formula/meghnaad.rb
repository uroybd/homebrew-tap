class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.18"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.18/meghnaad-0.8.18-aarch64-apple-darwin.tar.gz"
      sha256 "0572df40ab1b78227c9531351114912c1539a929b1829da59a779a15837bc4b1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.18/meghnaad-0.8.18-x86_64-apple-darwin.tar.gz"
      sha256 "d609418c8da275d999c601474bf419aac4377086c9315b601cb7d2e06c55da5d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.18/meghnaad-0.8.18-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5dfe9e8f502f67749862bdd43be3e5e3af603b67309496c089be9048afd456df"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.18/meghnaad-0.8.18-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d4ad4109316721c138c46fed69872f1cf048f633e1d873fe63007678f21fd937"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.18/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
