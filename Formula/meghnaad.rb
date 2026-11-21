class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.44"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.44/meghnaad-0.8.44-aarch64-apple-darwin.tar.gz"
      sha256 "9b30ab5ab466d8dadec306cb4d157653d99fdda02090ee928f8a533565429ac2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.44/meghnaad-0.8.44-x86_64-apple-darwin.tar.gz"
      sha256 "88ca0a065d3ce003b4ff86eb33fcf70e27f097295206af68ac69a49a15227c87"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.44/meghnaad-0.8.44-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "054c50754fafeb528dd25b12402c3f55357dce3d60c7d5275ec8f349ddc25af4"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.44/meghnaad-0.8.44-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0c58a67ceb68f2b0f88125c52a04a8f5cb1b82093173924c9c5f46cefc822c45"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.44/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
