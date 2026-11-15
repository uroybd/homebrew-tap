class MeghnaadTui < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.69"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.69/meghnaad-tui-0.6.69-aarch64-apple-darwin.tar.gz"
      sha256 "409ab714269d9dc4d013b442bc87f01e3dee6a26aef74c3834e02adc3a9cee87"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.69/meghnaad-tui-0.6.69-x86_64-apple-darwin.tar.gz"
      sha256 "3fcbc6b8e71fd0b40fc46a07708cb69a5f61d2ce94c7a8d271a9200362245266"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.69/meghnaad-tui-0.6.69-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d7faa7fc423ef445e764f8f6c15f7e69dfeeac4e760c134aad86fe73a73cbf64"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.69/meghnaad-tui-0.6.69-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "34a2342152cc2775791d2c0d3891f0c8ad6cfadd3744c63eb41796faa27581f6"
    end
  end

  def install
    bin.install "meghnaad-tui"
  end

  def caveats
    <<~EOS
      Run meghnaad-tui: it works on the tasks task reads. Its task commands are kept in
      settings.json in $MEGHNAAD_CONFIG_DIR, else ~/.config/meghnaad.
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.69/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad-tui --help")
  end
end
