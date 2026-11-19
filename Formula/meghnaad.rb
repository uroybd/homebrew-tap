class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.15"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.15/meghnaad-0.8.15-aarch64-apple-darwin.tar.gz"
      sha256 "53af377d5e0b6eb18d8282b74fb354c6b8488431599ac79b7da594604f64450c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.15/meghnaad-0.8.15-x86_64-apple-darwin.tar.gz"
      sha256 "533841d8454233dc14f562ffce01388dd264571201ecbb44524d9913bdfb2068"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.15/meghnaad-0.8.15-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "58e7fa9fb80d773db58b05c6d434176cc46c7c0e19cd6350e01783c960d2252f"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.15/meghnaad-0.8.15-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5284d7f750acf71cb7f6eed4f3e15ca33cee4f03eeb33ebe8b6491c86be3f963"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.15/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
