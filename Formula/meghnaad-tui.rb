class MeghnaadTui < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.57"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.57/meghnaad-tui-0.6.57-aarch64-apple-darwin.tar.gz"
      sha256 "16852a6e22ccd2fc37f4700e36dd33fe336cd262b356f000e2d4027561a36c90"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.57/meghnaad-tui-0.6.57-x86_64-apple-darwin.tar.gz"
      sha256 "8096400b275b287d6148cb8d15addc355196353b1efdfeab9996d8e93deb0c22"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.57/meghnaad-tui-0.6.57-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "77ffca10bf0057060496b04f5328a70cd50ba12b6e95806dca5bee5212661942"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.57/meghnaad-tui-0.6.57-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1aa2c48f0055bebc2b15c3c997b2152ae8bb2b52016b687d90e6375ac5639f50"
    end
  end

  def install
    bin.install "meghnaad-tui"
  end

  def caveats
    <<~EOS
      Run meghnaad-tui: it works on the tasks task reads. Its task commands are kept in
      settings.json in $MEGHNAAD_CONFIG_DIR, else ~/.config/meghnaad.
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.57/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad-tui --help")
  end
end
