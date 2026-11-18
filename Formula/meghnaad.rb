class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.4"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.4/meghnaad-0.8.4-aarch64-apple-darwin.tar.gz"
      sha256 "4f1d5a1a4e8f2a5267e2f119ec9cfa5d27a5f94495b91d6d0dda2d7d9903e038"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.4/meghnaad-0.8.4-x86_64-apple-darwin.tar.gz"
      sha256 "b82bf5376fb6101b6c607c979253ed25d60d440b8aabf7016e1fafea8b0263d5"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.4/meghnaad-0.8.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "43c411ef54d00456c81117cf3f6d38973ed1643bb2d98cdad46f8253a75db2f5"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.4/meghnaad-0.8.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9c79e5a9ddcf6223a6cc7ab4357c536ef75e6eaadc91039bb244552831ecb3ce"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.4/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
