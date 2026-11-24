class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.53"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.53/meghnaad-0.8.53-aarch64-apple-darwin.tar.gz"
      sha256 "a91603879fbb66d308b62751b1ff4bfaf88b96c59105ca6800a0f493e6024845"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.53/meghnaad-0.8.53-x86_64-apple-darwin.tar.gz"
      sha256 "14064d68bf82c4b42744121376bfbffbc27fe8210d1d0b89320a563185a6a372"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.53/meghnaad-0.8.53-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "69b37498f1d5cce5741485dbab1a7281db521d41c9bf4194c9d2a0f1a936bb59"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.53/meghnaad-0.8.53-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a1995fb07fbf368cccb906198dbc0a3d0c28bc562a2809db537e263881147d61"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.53/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
