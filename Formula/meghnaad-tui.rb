class MeghnaadTui < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.65"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.65/meghnaad-tui-0.6.65-aarch64-apple-darwin.tar.gz"
      sha256 "942dacd1002b69a1ed63fd665551aceb358d7f4e18342be64a0479100f892997"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.65/meghnaad-tui-0.6.65-x86_64-apple-darwin.tar.gz"
      sha256 "2ca8090a8940bf67505412da39ec7065f8cd4fcf674286da7a679c507ad90eb0"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.65/meghnaad-tui-0.6.65-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7308016fb49b1fd1522786620db63045f91a495173174471af50a5140cebc7ef"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.65/meghnaad-tui-0.6.65-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f4f2b99e8bdcaa31d309408977bf47289566736ab199aec54d65ca8c99626095"
    end
  end

  def install
    bin.install "meghnaad-tui"
  end

  def caveats
    <<~EOS
      Run meghnaad-tui: it works on the tasks task reads. Its task commands are kept in
      settings.json in $MEGHNAAD_CONFIG_DIR, else ~/.config/meghnaad.
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.65/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad-tui --help")
  end
end
