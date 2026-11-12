class MeghnaadTui < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.53"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.53/meghnaad-tui-0.6.53-aarch64-apple-darwin.tar.gz"
      sha256 "2ff1d7642778aec1098182a436a3a532f13f8d3a72157ec902af603229289925"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.53/meghnaad-tui-0.6.53-x86_64-apple-darwin.tar.gz"
      sha256 "ae3f4a3ae4c8565769daae8ce65b64ce27144272ceca349fd34d8a4d55ea5e8c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.53/meghnaad-tui-0.6.53-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c62ef04d3d6e12e156ea293301bfe0758a20e46624cd9ee178a58b2e0d62c0d9"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.53/meghnaad-tui-0.6.53-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "21f0fafb79e4ea456d1b8e5a4f786e51f5d50499b3a5781335c07e65e1c7e276"
    end
  end

  def install
    bin.install "meghnaad-tui"
  end

  def caveats
    <<~EOS
      Run meghnaad-tui: it works on the tasks task reads. Its task commands are kept in
      settings.json in $MEGHNAAD_CONFIG_DIR, else ~/.config/meghnaad.
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.53/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad-tui --help")
  end
end
