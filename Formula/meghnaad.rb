class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.6"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.6/meghnaad-0.8.6-aarch64-apple-darwin.tar.gz"
      sha256 "05243916267baa69bd452581e74e0c42bf6201decdbae8f49612b65a5c51cfeb"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.6/meghnaad-0.8.6-x86_64-apple-darwin.tar.gz"
      sha256 "30658d950f7bedd108ec9eed7941e1302378c8be43b5123503df84d1e6437d9b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.6/meghnaad-0.8.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1374f9b4bb7fb972c6b80a63b50553092dfe555c97ad444ec66bfb4f9d2ba2fc"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.6/meghnaad-0.8.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "540b6567000f6e0bda3136c222ccc5637a4a422298b5719c97f862f255c6ddc9"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.6/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
