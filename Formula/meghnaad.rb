class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.16"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.16/meghnaad-0.8.16-aarch64-apple-darwin.tar.gz"
      sha256 "bf479f1e6c342351330ebc03d62c2a9ebe91e5f7a3d1971ff4df61fee12faf18"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.16/meghnaad-0.8.16-x86_64-apple-darwin.tar.gz"
      sha256 "ac12414dc5145fee48517807dd50cbd773d24e9a4b6f23e6e9a151046360578c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.16/meghnaad-0.8.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7e930c6388b0237113c79369acd44c16a8f9acebb2e3fe695ef0a87ba6f0d7d0"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.16/meghnaad-0.8.16-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3d15dad05733e334b888431755392086e074574432b47e69004d7219a2728bc1"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.16/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
