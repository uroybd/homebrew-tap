class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.72"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.72/meghnaad-0.6.72-aarch64-apple-darwin.tar.gz"
      sha256 "8ce2e0ecf830a03f68d1a4e620ae4398e1a87fe8be469068246ab778ed600aec"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.72/meghnaad-0.6.72-x86_64-apple-darwin.tar.gz"
      sha256 "ddeceb97c40ca8095db41de70cd2b8d117783626fff57426c542bf28548bfd1c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.72/meghnaad-0.6.72-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9b11b7923b9862aaa8d1fd2efd0bcec0eb39fefbf6d55815308085fb5ed344bc"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.72/meghnaad-0.6.72-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5d2b3923abe61bb3b8a739bd6723b4306e9de243a5547ba51db5ac9cace9d862"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.72/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
