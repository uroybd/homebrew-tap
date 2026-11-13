class MeghnaadTui < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.58"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.58/meghnaad-tui-0.6.58-aarch64-apple-darwin.tar.gz"
      sha256 "b53d469fcd11658fabb1a912f11e9d8e8b9e8dde37eb820ef113559fbded7d4b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.58/meghnaad-tui-0.6.58-x86_64-apple-darwin.tar.gz"
      sha256 "c2f0eacc789f58e6a58c73711ee60b5b2337616d1d9aad923352ff752bcbebbe"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.58/meghnaad-tui-0.6.58-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "da2113e6f3c46cacf2977ab1831c4a5f281d1ffb4015b9053b90964123d15982"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.58/meghnaad-tui-0.6.58-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "14518e9d660dafe15c098650a5031ea979ad4cfb1bdd3c5037de6292a43a46b9"
    end
  end

  def install
    bin.install "meghnaad-tui"
  end

  def caveats
    <<~EOS
      Run meghnaad-tui: it works on the tasks task reads. Its task commands are kept in
      settings.json in $MEGHNAAD_CONFIG_DIR, else ~/.config/meghnaad.
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.58/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad-tui --help")
  end
end
