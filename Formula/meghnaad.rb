class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.52"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.52/meghnaad-0.8.52-aarch64-apple-darwin.tar.gz"
      sha256 "724020b3d8b84fea6b4fcd88c60ac30b798cf1e10b0a01cacd36198586b3d207"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.52/meghnaad-0.8.52-x86_64-apple-darwin.tar.gz"
      sha256 "959bf92a9aff2a57fd46e80441358b721f32f185086d685aa96d39f30f3bd573"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.52/meghnaad-0.8.52-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "06a6a1533d02f090d4d94bb92fab171a2121d78626561cf928d44188a169b499"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.52/meghnaad-0.8.52-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "63d6a25315e690d7c1581a1956fd9c34f21fc8344cc982a42bad07b4ac273b0c"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.52/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
