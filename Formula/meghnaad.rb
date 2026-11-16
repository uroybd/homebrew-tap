class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.74"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.74/meghnaad-0.6.74-aarch64-apple-darwin.tar.gz"
      sha256 "f09e5412a30e5fe2fb67870bcd955b51535d7ab9680faa5a10708c0971585188"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.74/meghnaad-0.6.74-x86_64-apple-darwin.tar.gz"
      sha256 "560a200a02b7a31784a43eb77c035bc58c41177549f10493ba329f458bf01079"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.74/meghnaad-0.6.74-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8035be008070a64f519d52837d41776ae5ed79cb54f2826095c309f308f0f0a0"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.74/meghnaad-0.6.74-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "df57a25325c2c935396af6dda36f843efebb2d49a6ab70a185d29635aaa4d2ad"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.74/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
