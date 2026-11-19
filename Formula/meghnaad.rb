class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.17"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.17/meghnaad-0.8.17-aarch64-apple-darwin.tar.gz"
      sha256 "325d66d886edc3213d28e670cbb1f5c233c51a3ee23e8063b44c66c7a3d4dbcb"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.17/meghnaad-0.8.17-x86_64-apple-darwin.tar.gz"
      sha256 "d42b5ca6d5dbfdb27c617890934c7a5f02e05eeb3601ab4f9ae06b8d02c5c8ef"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.17/meghnaad-0.8.17-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6d73fbb53c8e333b139df0fa8f7c0028ae56473e45970daff4d3ebeb4bf223bf"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.17/meghnaad-0.8.17-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "203f50e029c1217686162a1d2a41223d762b25236d0e3b5fcc10c3df7621eb37"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.17/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
