class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.43"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.43/meghnaad-0.8.43-aarch64-apple-darwin.tar.gz"
      sha256 "d55fe71ef1945d6225b5f5b0a901a6121fa6d9839de779b52092b916331e43f6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.43/meghnaad-0.8.43-x86_64-apple-darwin.tar.gz"
      sha256 "d7327ab1df1b78fcd9cdce4d528a6f45c3df6ed14b5d0d1345da5f946cef97cf"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.43/meghnaad-0.8.43-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cc30409127176a092f5509471c67a30485af717841b53033edf5ff78b5570f02"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.43/meghnaad-0.8.43-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d7de4225f6d7030d8ab0df082b47f837eecd520c62c09b4c6dbec658337881b7"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.43/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
