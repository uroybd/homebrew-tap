class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.11"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.11/meghnaad-0.8.11-aarch64-apple-darwin.tar.gz"
      sha256 "615b2806a0ff78c953fbe00550cec51a3c915ca17047309e742b5a2c6a5bbec1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.11/meghnaad-0.8.11-x86_64-apple-darwin.tar.gz"
      sha256 "3557eca54d3961150db56b479afd5e66108f399c080965d8861129dd09d092c2"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.11/meghnaad-0.8.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7e44b6964be0ef5ad9ea1d84a636e6fb5cb1ac9de0f1c3235921ff961629c062"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.11/meghnaad-0.8.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d1bc051c38431754e989f6aaa0eef1a690841d89f05077152572e979ea1bce20"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.11/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
