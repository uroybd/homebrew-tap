class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.36"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.36/meghnaad-0.8.36-aarch64-apple-darwin.tar.gz"
      sha256 "8488d75145aff8dbd32d6ad2c85166a0eb0118dfb4fc96c289781d16dd3ce6c8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.36/meghnaad-0.8.36-x86_64-apple-darwin.tar.gz"
      sha256 "1b1ebc0d0da17578582eb9dd72f3066c5f1dfc345b00aba4345e80c148539731"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.36/meghnaad-0.8.36-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "af122cec02d47a1688a97a07164db2b0460f6486263ca9353d952377948949e0"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.36/meghnaad-0.8.36-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2d7382ad948bb4ef3b7eee73e6b4d1ba3fce4247853867f8e5cdd161ade8f26b"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.36/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
