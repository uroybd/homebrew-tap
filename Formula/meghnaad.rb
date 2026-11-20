class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.26"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.26/meghnaad-0.8.26-aarch64-apple-darwin.tar.gz"
      sha256 "b6e25988e811804459f4848e5e32bae657e0e9e1de1644b58237d3b9d4e50165"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.26/meghnaad-0.8.26-x86_64-apple-darwin.tar.gz"
      sha256 "e4e11827252222fe45b1ecca30cc20587dd44011b8e2726ad64019c96452917c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.26/meghnaad-0.8.26-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e02537e3893d378e6bdc43ac5219142ca35e574e4eabf0d9d3c31306b7140bcf"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.26/meghnaad-0.8.26-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bbd260dabff866e474d516e1d0d878b9c6bd3f33f9abbb10f824745e37dbf7af"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.26/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
