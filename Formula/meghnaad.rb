class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.49"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.49/meghnaad-0.8.49-aarch64-apple-darwin.tar.gz"
      sha256 "91db73e54cb6261090f4266cd65bab8d06733df3517e038cd93a1b1c44367daa"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.49/meghnaad-0.8.49-x86_64-apple-darwin.tar.gz"
      sha256 "6af5d31b6ca9b1048ae5b08f3a7d33177ced94f7a7c37aee080ec5170c1641ad"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.49/meghnaad-0.8.49-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "52b13e8827f1802f1ca12b8e8d8a2c2d86112caec9d1d4b3eb2dad20068b2f37"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.49/meghnaad-0.8.49-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b5a09c39e74b4f005f36dfb1957e34f348164b80e830f6eb32f74967a6d47640"
    end
  end

  def install
    bin.install "meghnaad"
    bin.install_symlink "meghnaad" => "meghnaad-tui"
  end

  def caveats
    <<~EOS
      Run meghnaad: it works on the tasks task reads. Its task commands are kept in
      settings.json in $MEGHNAAD_CONFIG_DIR, else ~/.config/meghnaad.
      meghnaad-tui, its old name, still runs it for now.
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.49/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
