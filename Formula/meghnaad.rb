class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.80"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.80/meghnaad-0.6.80-aarch64-apple-darwin.tar.gz"
      sha256 "778be81e73633174314ef30003cd90b9287064b5b7c076a4e9e0914c9d0c2723"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.80/meghnaad-0.6.80-x86_64-apple-darwin.tar.gz"
      sha256 "c35fb26df2a215872201ebee99f7b0e87ba4cff9b2fc265de7f162cfcb2fce88"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.80/meghnaad-0.6.80-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f4eb3bf6ea691e3149e85c616638c4038b0c3faafce3cf6bab580c28b6ec6eb7"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.80/meghnaad-0.6.80-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8465617130df61c1c478fffc68964d94477d08470eaf191fa9316e176c197700"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.80/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
