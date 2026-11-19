class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.25"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.25/meghnaad-0.8.25-aarch64-apple-darwin.tar.gz"
      sha256 "23f954cee38873923db238cc2c7391ef1f63d6c0ee4f83b9deea043c346cf201"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.25/meghnaad-0.8.25-x86_64-apple-darwin.tar.gz"
      sha256 "c7d1abd494c4774a54bda293ce8dad6dec1a8d15c4b3cbca41133917e42d6be5"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.25/meghnaad-0.8.25-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "12fb3992836673d55c6a3c6a0a65b4f24e4f045f877b17678a0ccfa0ca5dbf4c"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.25/meghnaad-0.8.25-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "33ea8a405caf4faee289136bfe2546c4e62ad2202846ad6adbebd59a010b0882"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.25/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
