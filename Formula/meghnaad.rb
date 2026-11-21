class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.34"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.34/meghnaad-0.8.34-aarch64-apple-darwin.tar.gz"
      sha256 "c1c390d397b9882ad30f8ed1c2d7a075367be5d30fe0fb74a05ad0262180966d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.34/meghnaad-0.8.34-x86_64-apple-darwin.tar.gz"
      sha256 "2c59fec8dc92fbb012747abb56d96c22d36bc066403889cc400abf105cf2bc68"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.34/meghnaad-0.8.34-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7b24662d564608c21fdd6d528d60baa4e2d9b4adbb88aeb6f9535895789509ef"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.34/meghnaad-0.8.34-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "57047a969733049a8d405d95f5fba80ccc64036c706a22a60a7c7702dbdd251a"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.34/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
