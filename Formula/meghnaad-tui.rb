class MeghnaadTui < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.52"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.52/meghnaad-tui-0.6.52-aarch64-apple-darwin.tar.gz"
      sha256 "6d1dec5cd1838320032f1ef7cebbf588c109275208773fb44846824e8716572e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.52/meghnaad-tui-0.6.52-x86_64-apple-darwin.tar.gz"
      sha256 "fe84a80a9e0c88a151ceb093d265de1f39d0e0e7343117d593df4ea7a812c56f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.52/meghnaad-tui-0.6.52-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e01cc42e1cc3bbbd9dfc253dec2d72206c605a00d30db0020b63ae6f56995f1d"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.52/meghnaad-tui-0.6.52-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "665a4770949276e5e8f40a225a3d9dc0846e9a40bfd8226b5faddd82514b7a99"
    end
  end

  def install
    bin.install "meghnaad-tui"
  end

  def caveats
    <<~EOS
      Run meghnaad-tui: it works on the tasks task reads. Its task commands are kept in
      settings.json in $MEGHNAAD_CONFIG_DIR, else ~/.config/meghnaad.
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.52/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad-tui --help")
  end
end
