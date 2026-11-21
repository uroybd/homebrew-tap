class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.31"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.31/meghnaad-0.8.31-aarch64-apple-darwin.tar.gz"
      sha256 "e07361318311f6563368d2ceb7652284893667dad9f75e683926141cf50e4140"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.31/meghnaad-0.8.31-x86_64-apple-darwin.tar.gz"
      sha256 "4d3f16a16faa83199eb3bda1934c1f725a90f7a7b4a135d06c1cb4d4a104b56b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.31/meghnaad-0.8.31-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8fd3da4aaa8cd4ba8cfd5b7b34c56fe749159d009eb6ea8f13877488a3b23364"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.31/meghnaad-0.8.31-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4125fcc496221e227b86af4172b41c87bffc4cd4de88779f44bd750b508140e2"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.31/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
