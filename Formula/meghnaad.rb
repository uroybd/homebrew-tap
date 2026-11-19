class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.24"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.24/meghnaad-0.8.24-aarch64-apple-darwin.tar.gz"
      sha256 "8cacbb8f69f8d2b9a9dcf3b47e332c10a550bd0bf3db461cf1ce268c9bddb9f8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.24/meghnaad-0.8.24-x86_64-apple-darwin.tar.gz"
      sha256 "f1287109123268269b1b2f8600899048e54d11d53081b7cc16dbc97a4d19ec96"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.24/meghnaad-0.8.24-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "afb4927d5560331c956d8e087a03fca5aa7757782d2a19a712ea2471c61c8c51"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.24/meghnaad-0.8.24-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a1072a2d9c92a7dd02324fe80368a07b83af979190f49436b1f12c6f0a6e7656"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.24/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
