class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.29"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.29/meghnaad-0.8.29-aarch64-apple-darwin.tar.gz"
      sha256 "64bdb5306b6cf11ae3eb34edd041a98485658bff684456595e07a95490b45f0b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.29/meghnaad-0.8.29-x86_64-apple-darwin.tar.gz"
      sha256 "9c767d15ebb7cb86753356e4f79ab34829d8b48042dbb529eb8accee11b2a566"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.29/meghnaad-0.8.29-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0cd33ddb77fa9adc681081c8686e6995c3b502dd7d658327c6dda2d6eafcdd1f"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.29/meghnaad-0.8.29-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c20094a93c1fe3f974dd5803eba96e1df89dff6b5fefe48a7a0bcede4d57af0a"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.29/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
