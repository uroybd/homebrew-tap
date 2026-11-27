class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.75"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.75/meghnaad-0.8.75-aarch64-apple-darwin.tar.gz"
      sha256 "8b416d16604b58c6be323901b608d965978fca08e44891856dfae0a1b955ab29"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.75/meghnaad-0.8.75-x86_64-apple-darwin.tar.gz"
      sha256 "1d13aa5e68d46b19e0fb81caca592d1d796ab8e81fec44cc3feed1bd9611452c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.75/meghnaad-0.8.75-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5671bd5fff1180b908b1bd3bdd6a74b0ff7ffcd5275f6ea033e39899827fc266"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.75/meghnaad-0.8.75-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "addd9b5726ad19815714634085c2d131846d5b4dde0cf55986bb2e4413c4c4b5"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.75/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
