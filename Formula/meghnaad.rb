class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.77"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.77/meghnaad-0.6.77-aarch64-apple-darwin.tar.gz"
      sha256 "96f8af83d49a2d2c3c56a4c3030fa6dd51236ec0d5eeb23f0e7b441500c6eaa4"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.77/meghnaad-0.6.77-x86_64-apple-darwin.tar.gz"
      sha256 "54d16ca1130ddfbea0395232d2ae8e3d036fae26341fc96b89e4b04945c9c83e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.77/meghnaad-0.6.77-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "87cdefab91ed725ec4d4e019d58d8980d487f69c4a67fcba9bb52721e0219025"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.77/meghnaad-0.6.77-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ec6a3947491e94c71c95bce34109a0b08aadeb953b4d233ef5658cc8b8d7eea5"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.77/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
