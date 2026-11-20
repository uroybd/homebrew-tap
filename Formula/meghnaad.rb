class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.30"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.30/meghnaad-0.8.30-aarch64-apple-darwin.tar.gz"
      sha256 "6b1d9b68c77985f491ff76d7a74b47692d562d4f5858aa6b942f6c0202e5d259"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.30/meghnaad-0.8.30-x86_64-apple-darwin.tar.gz"
      sha256 "9bf9b9dda9a9edc74cf6cc177c7696521881996bc112fce6d10b5f3c1d3d3f1c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.30/meghnaad-0.8.30-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e5f3c302b41587f861891dd86c6ad9b235a049425ce7020441bb8e302aee85a0"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.30/meghnaad-0.8.30-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b259885471c9a0ecf96f8c24203a32e5ef9e786c85c321d3b3e52943009defc9"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.30/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
