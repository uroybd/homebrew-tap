class MeghnaadTui < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.54"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.54/meghnaad-tui-0.6.54-aarch64-apple-darwin.tar.gz"
      sha256 "db1367a5c165fdfdd35ed14551db2fbecc24dd5f5e20255505ecfc0d9a7655da"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.54/meghnaad-tui-0.6.54-x86_64-apple-darwin.tar.gz"
      sha256 "159cb0b4dac9fa34ea2e5747e0abebf4dbd809f790a62eebd664b357485d5a52"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.54/meghnaad-tui-0.6.54-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "96ed24b62b62c56fc481d6f76825a137e84daee4e7705c5ca758d927dbabca37"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.54/meghnaad-tui-0.6.54-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ef2050a92f27a1f2b9366d85c8d8d4a0876cd066a6f1209030f7ade05196f359"
    end
  end

  def install
    bin.install "meghnaad-tui"
  end

  def caveats
    <<~EOS
      Run meghnaad-tui: it works on the tasks task reads. Its task commands are kept in
      settings.json in $MEGHNAAD_CONFIG_DIR, else ~/.config/meghnaad.
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.54/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad-tui --help")
  end
end
