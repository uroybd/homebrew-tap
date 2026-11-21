class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.38"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.38/meghnaad-0.8.38-aarch64-apple-darwin.tar.gz"
      sha256 "bfa947aa26422e96ad7a9930cdd3ed9d78633a7070356fcb69a10e007f2ff35e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.38/meghnaad-0.8.38-x86_64-apple-darwin.tar.gz"
      sha256 "933a8d038747158bfaf45222d3b17a323772f6a2735f3db1d8afa25e2bec8866"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.38/meghnaad-0.8.38-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "082b002556b2e442de5d9e0a4bfe0933abf6aa3c845e2c5fc783dfbdbf6e63eb"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.38/meghnaad-0.8.38-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ffc34d4c691ffe4d7017dcdcfd8463d42cefbcea78b343d3e13fcc2b7adcfbbe"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.38/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
