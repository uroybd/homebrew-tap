class MeghnaadTui < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.63"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.63/meghnaad-tui-0.6.63-aarch64-apple-darwin.tar.gz"
      sha256 "9747b9b2ae65cad9458a5411101e5336e3c0b83eacd92bd6d86c8c8f38609e93"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.63/meghnaad-tui-0.6.63-x86_64-apple-darwin.tar.gz"
      sha256 "a9160dd737d1ecf57cf0245fd25eff77207498610144fe632b3e7cce9ab9d810"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.63/meghnaad-tui-0.6.63-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "de27b28b0c30079b6e408ecc3e263d4e40544323ee2e7bd5d1de3f1589940951"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.63/meghnaad-tui-0.6.63-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8cb1396e3e53da23e20ecace957fedfebf247f951f9305c196d1896f0d9c7030"
    end
  end

  def install
    bin.install "meghnaad-tui"
  end

  def caveats
    <<~EOS
      Run meghnaad-tui: it works on the tasks task reads. Its task commands are kept in
      settings.json in $MEGHNAAD_CONFIG_DIR, else ~/.config/meghnaad.
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.63/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad-tui --help")
  end
end
