class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.28"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.28/meghnaad-0.8.28-aarch64-apple-darwin.tar.gz"
      sha256 "92e147e0d3c07d68d993e4f2b2c0e236548a40bf96bbb1662acfb92e67b28316"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.28/meghnaad-0.8.28-x86_64-apple-darwin.tar.gz"
      sha256 "0f50df20141a4ac7f8eccb1d8bc8810abb77ca02eec8756a0267b738e8445d9e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.28/meghnaad-0.8.28-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4845a45c12d5575b9683610b377422f4b6cda659a68caac0d571a83815cab290"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.28/meghnaad-0.8.28-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4621f232efcff5ebea5e579906f3230b5a91c0dfe237086cbf2c54882dc4e61c"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.28/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
