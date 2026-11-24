class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.59"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.59/meghnaad-0.8.59-aarch64-apple-darwin.tar.gz"
      sha256 "4caf96cf1d15ea81c97df9a8e0359aff24ee45a89ba9bf30ce3023be770cad05"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.59/meghnaad-0.8.59-x86_64-apple-darwin.tar.gz"
      sha256 "ec7c417ede98028182aac3e5a66c3ce7b9b2e74fd5d32c35ba23f91f303bd0c4"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.59/meghnaad-0.8.59-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4dd56be570ee9c76476512d29305f62cec0e31cfc97858874ef099a06d919e55"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.59/meghnaad-0.8.59-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4dc5e463f98fcda7ef120cd07c760efa64df593456553a0beebea1c329c89c1b"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.59/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
