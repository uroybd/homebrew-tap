class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.57"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.57/meghnaad-0.8.57-aarch64-apple-darwin.tar.gz"
      sha256 "73382bc4ff56050039fbb30d606e5111cfe30f71ac33ddfff8c8ccdbd822d05b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.57/meghnaad-0.8.57-x86_64-apple-darwin.tar.gz"
      sha256 "60df553b985e35889c7a1e9a34f17393d1f48a87fa3a820ec1cc0f4f0a4d56ee"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.57/meghnaad-0.8.57-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "07e92073cf7e70242a8d352978bd0ba39099b8b04ade5fe87d86d161cb4fc5ed"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.57/meghnaad-0.8.57-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8c18365f027cd28d00680f575ac302aa4b07c0386bac55cf74d7f011d5992446"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.57/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
