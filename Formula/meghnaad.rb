class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.37"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.37/meghnaad-0.8.37-aarch64-apple-darwin.tar.gz"
      sha256 "8ed37821ab46af91fd6293f9373ca0bccb754b40ade1ae2280107f41500cf46c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.37/meghnaad-0.8.37-x86_64-apple-darwin.tar.gz"
      sha256 "9d9dd088fba8ebb3a9afc5d163abb1a8f9bb6e1d739cafaea7fecd2567d12919"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.37/meghnaad-0.8.37-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0ba148890d26f8caf439fbee79049045d96bea3d3563b4b7425f46a708d148bc"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.37/meghnaad-0.8.37-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bbeb758be45907f795342392d4e3f7cdbb2e3c9a87dbd75a6380bd5ff469d6df"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.37/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
