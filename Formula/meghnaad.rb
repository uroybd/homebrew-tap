class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.72"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.72/meghnaad-0.8.72-aarch64-apple-darwin.tar.gz"
      sha256 "2bd55f97b6fa9bae12f29e2bf6eacacc90856aa6fb0a2de22c41584aec9d825b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.72/meghnaad-0.8.72-x86_64-apple-darwin.tar.gz"
      sha256 "f7dee2cf7de494d3098a5153080ec6a3c7c77f0ecd51a6f7085d899fbdeba4bd"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.72/meghnaad-0.8.72-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "10d657f7de242f8ac2787f18d6e05b8463f9043617a7b74c3bc3f6b360b09166"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.72/meghnaad-0.8.72-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "01328b575724e464d34df8f1861eaeedfda1ae9f3194d92d84388a3a9b552808"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.72/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
