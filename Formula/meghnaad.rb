class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.69"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.69/meghnaad-0.8.69-aarch64-apple-darwin.tar.gz"
      sha256 "5af20a9578c0499118f626b7bb3edf755e30c71e4c7a9c1dcd85ade00a9a18dc"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.69/meghnaad-0.8.69-x86_64-apple-darwin.tar.gz"
      sha256 "5e909a38cba6285a5eee095fc8b0756fb1db52eb91a29b64195207c68d90aea3"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.69/meghnaad-0.8.69-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a4618c7d466663524437a668283018037c8f44b03ac51e73024120744a66c05d"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.69/meghnaad-0.8.69-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f2c3a218ed9b5f0123ba3f5803b5ac4b63e0934824515f9bea6c8231b51fa286"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.69/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
