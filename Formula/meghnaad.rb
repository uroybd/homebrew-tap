class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.51"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.51/meghnaad-0.8.51-aarch64-apple-darwin.tar.gz"
      sha256 "0467b939032e3daec95f5ba6950849322f74a5fdc42a468a506e8eecda17140e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.51/meghnaad-0.8.51-x86_64-apple-darwin.tar.gz"
      sha256 "ad78b4fded99010b78f1140b8f641309947d877aa65f21e02d2437c888d3a96f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.51/meghnaad-0.8.51-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "45c39ff6d046db8c4b4a21d730f7a9c8c8c407ddd6f167b3c67d0e344fdeaafd"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.51/meghnaad-0.8.51-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0b0105d71eb37ccd0f316232f0fda8391cee53e2cb8d0231f2a3a111b9f2c638"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.51/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
