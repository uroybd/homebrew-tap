class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.74"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.74/meghnaad-0.8.74-aarch64-apple-darwin.tar.gz"
      sha256 "80fe9f5120d4aa687bc9c7925c024ad23a073b5b8b5e6849543f26573845c5c6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.74/meghnaad-0.8.74-x86_64-apple-darwin.tar.gz"
      sha256 "403b1de4a3d019f9a3d1b2eeaae5bf93e5a9de4340881fe6ee6050c326d6dac2"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.74/meghnaad-0.8.74-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "30c2da740b1c07d94d7acd2f14db857739d79cc4b80f3bccb9e59a06e9ea4a3a"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.74/meghnaad-0.8.74-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "33416c5fcedad15b61ca6ba77fd2b6c06ab8b04b3fe04c7e4c0aba23094af1ee"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.74/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
