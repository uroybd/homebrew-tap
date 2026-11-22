class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.50"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.50/meghnaad-0.8.50-aarch64-apple-darwin.tar.gz"
      sha256 "c5d19b6d36aff09bf23087d615a1e11c96bd99c8acd4c038ba288f2ff6c6261f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.50/meghnaad-0.8.50-x86_64-apple-darwin.tar.gz"
      sha256 "ddf185dadd3ea85d563062bf21b89e246046b3bf113802ea7b8a82935f2648b0"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.50/meghnaad-0.8.50-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fa16861858258440e8b87e7f3de70647017ae5c9a3965adfc30055aba0e90d12"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.50/meghnaad-0.8.50-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3559c9a5ca5721d1308909fd449422b807264df972582bca762b964b60004ba8"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.50/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
