class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.13"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.13/meghnaad-0.8.13-aarch64-apple-darwin.tar.gz"
      sha256 "ccb243c58a83a5543cc9d0942f809fa80231c294710511b5cf787efa599b14e6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.13/meghnaad-0.8.13-x86_64-apple-darwin.tar.gz"
      sha256 "cc44f7907782f591e626bf538d133a7a6614be174b10fb4909af8f96f955d475"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.13/meghnaad-0.8.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e5c6918a1242833a3293b54fd3a89e96fdc934f90a88047eb84a322c77c3ca98"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.13/meghnaad-0.8.13-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ed07af70af6d189c244bf694f99c02c62f1a0aa578ed17bfb56a3ae33525c0d9"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.13/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
