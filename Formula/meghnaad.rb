class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.5"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.5/meghnaad-0.8.5-aarch64-apple-darwin.tar.gz"
      sha256 "e29c97f2c997aab87562feb22478b2786b19281f963cf7fffe2e3a2b672d55a3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.5/meghnaad-0.8.5-x86_64-apple-darwin.tar.gz"
      sha256 "98217d9b1d45807bfe3bc48920896ed08e14dd73585f611334b68ec1707631be"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.5/meghnaad-0.8.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0fc24e47b6ec9412fa276527c7d0b86bf3d64857b3f977150ba672ab24c419e1"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.5/meghnaad-0.8.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7d30187edc0189d66b907c55e4a9c375b4cd35ecff2d39aaff32985416284f57"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.5/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
