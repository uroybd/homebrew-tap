class MeghnaadTui < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.59"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.59/meghnaad-tui-0.6.59-aarch64-apple-darwin.tar.gz"
      sha256 "233f1db82770611db7f5b4e2ed5c906bb7b9edb765b0aabf79ea0b53bef382d0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.59/meghnaad-tui-0.6.59-x86_64-apple-darwin.tar.gz"
      sha256 "749f898a9e4b0839c95ead6b614b36a0c74b790296fb3ac190dfca6e131e6ac4"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.59/meghnaad-tui-0.6.59-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c7e28ef980ffce79a311421b64a3e49590e556f5acf83427b72931eba6d16838"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.59/meghnaad-tui-0.6.59-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7d4d97f4a698a852e2e3443fc22a09935807fff3b7e78b080ddecc4a0ae904b4"
    end
  end

  def install
    bin.install "meghnaad-tui"
  end

  def caveats
    <<~EOS
      Run meghnaad-tui: it works on the tasks task reads. Its task commands are kept in
      settings.json in $MEGHNAAD_CONFIG_DIR, else ~/.config/meghnaad.
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.59/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad-tui --help")
  end
end
