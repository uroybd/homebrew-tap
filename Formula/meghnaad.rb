class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.9.0"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.9.0/meghnaad-0.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "6442de3eb325bc17e4a6ec857b8d47b75f254ac5d54c0e2f3863bebf297c4273"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.9.0/meghnaad-0.9.0-x86_64-apple-darwin.tar.gz"
      sha256 "50c25a7470b0b1fe999271f9e0173c4c915bd4ed4f85ab0142055d6280791f3c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.9.0/meghnaad-0.9.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b6206e187697ebefe65b55a673bdc699912ee9447270f7e108a631756d83c4b7"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.9.0/meghnaad-0.9.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "117487729639bf5c5ca820526cfb0c0c0cbb1564303d54137e407c34d0220ddb"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.9.0/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
