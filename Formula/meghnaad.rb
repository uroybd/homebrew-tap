class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.55"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.55/meghnaad-0.8.55-aarch64-apple-darwin.tar.gz"
      sha256 "17dea6d2c38780fbab0d542a70c84a2f1382c1c25d24486ddebc58eb06ba4a69"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.55/meghnaad-0.8.55-x86_64-apple-darwin.tar.gz"
      sha256 "40f3966f44a337d5d67835bb86b95f71dcded354e97d7df2d9f39f6f5248d0ec"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.55/meghnaad-0.8.55-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "946185f56ce8687c3429f4a15824d281f647362bbffa56c11632e28144fd1ca5"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.55/meghnaad-0.8.55-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c43326b94ec281231299cc46897bcc8756b3efcbf6cb523def14c492decb30d8"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.55/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
