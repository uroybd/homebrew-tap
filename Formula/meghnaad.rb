class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.20"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.20/meghnaad-0.8.20-aarch64-apple-darwin.tar.gz"
      sha256 "38d8574bf940541fe0290d3eff01dfa94e367b61007daa719f63ded42f53a13e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.20/meghnaad-0.8.20-x86_64-apple-darwin.tar.gz"
      sha256 "2c5f9c519150a6511958cd5e63662b1028e0b9e401816de611cec1292fa0a948"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.20/meghnaad-0.8.20-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "25e66cf59ba9518c96c3c1375a79f7f14422325277ca2f427df6334d727a46c4"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.20/meghnaad-0.8.20-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "648fca37faf4a535f4cc114e431b2ce722144c49d10645c9d4fc279a4d1f3df6"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.20/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
