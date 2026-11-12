class MeghnaadTui < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.56"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.56/meghnaad-tui-0.6.56-aarch64-apple-darwin.tar.gz"
      sha256 "7e731caf32a3b3ee9704ead8baf156db156437dd3d870efecae41d4d62d59b5f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.56/meghnaad-tui-0.6.56-x86_64-apple-darwin.tar.gz"
      sha256 "39239a17a2908904fd3437458e658841d6d48af7c74fc22f789e23f278fcf3c2"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.56/meghnaad-tui-0.6.56-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "34703442b58efe77ea794834f9b94c5c9c5fc3c8bb42b1c3e3c3f3f7aab40c1b"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.56/meghnaad-tui-0.6.56-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0348ba818dd629ea1b770f373bc8e4f4d15c1febef81181c643b4e598ffdb702"
    end
  end

  def install
    bin.install "meghnaad-tui"
  end

  def caveats
    <<~EOS
      Run meghnaad-tui: it works on the tasks task reads. Its task commands are kept in
      settings.json in $MEGHNAAD_CONFIG_DIR, else ~/.config/meghnaad.
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.56/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad-tui --help")
  end
end
