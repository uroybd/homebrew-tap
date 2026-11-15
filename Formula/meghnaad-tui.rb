class MeghnaadTui < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.71"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.71/meghnaad-tui-0.6.71-aarch64-apple-darwin.tar.gz"
      sha256 "5dcd55d564252657300e4cfbf16142544043fe2504bb2353a77169aee75b934c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.71/meghnaad-tui-0.6.71-x86_64-apple-darwin.tar.gz"
      sha256 "6f310ce54fe78e431c8fb50cfd53a3c4c8ec33b26b6b1f2569ab98ffc8574fe0"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.71/meghnaad-tui-0.6.71-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b5c916585d3531b8fd4c69f0836106990e4079ffa4ff2f9ac4f136c42cb5ad8f"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.71/meghnaad-tui-0.6.71-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2ddf17c2c9e998739c6ca2029734190733c6e0e3857d4ab447f986436230f148"
    end
  end

  def install
    bin.install "meghnaad-tui"
  end

  def caveats
    <<~EOS
      Run meghnaad-tui: it works on the tasks task reads. Its task commands are kept in
      settings.json in $MEGHNAAD_CONFIG_DIR, else ~/.config/meghnaad.
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.71/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad-tui --help")
  end
end
