class MeghnaadTui < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.67"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.67/meghnaad-tui-0.6.67-aarch64-apple-darwin.tar.gz"
      sha256 "eb4123919537aeb6c5c86997489c1a00159267821edb3d797055c9f528855b99"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.67/meghnaad-tui-0.6.67-x86_64-apple-darwin.tar.gz"
      sha256 "e00b3af3fdf12bf17e2bffa375f97ae5978abcafa6c43926960b58c8be526851"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.67/meghnaad-tui-0.6.67-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f9173ff5d941a259368cfa3e2aca9e7c3d7857e668a485f01a791d5a5afa0669"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.67/meghnaad-tui-0.6.67-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "188fec38bc21c9a1edcbfece4588141c92b9e449a342a6735834c5ed6fee2e69"
    end
  end

  def install
    bin.install "meghnaad-tui"
  end

  def caveats
    <<~EOS
      Run meghnaad-tui: it works on the tasks task reads. Its task commands are kept in
      settings.json in $MEGHNAAD_CONFIG_DIR, else ~/.config/meghnaad.
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.67/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad-tui --help")
  end
end
