class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.83"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.83/meghnaad-0.6.83-aarch64-apple-darwin.tar.gz"
      sha256 "ebfc4a135457739b737cee52526d791df29371af7b01191a618bf0afa5e68317"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.83/meghnaad-0.6.83-x86_64-apple-darwin.tar.gz"
      sha256 "0a162e85530b33509da12737dd10d8056bfb84af1d0fe2377977cb53a1d21e95"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.83/meghnaad-0.6.83-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b14a7a37e33c6d3f3c10e594fbbf0516f49285ee1d8e8d59c73b31a1f0e4f66c"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.83/meghnaad-0.6.83-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5f62b3f07815c4b13bb9aced9fe926cd04963e20483e52a98c6aa3e0452aa2eb"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.83/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
