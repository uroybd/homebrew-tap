class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.78"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.78/meghnaad-0.6.78-aarch64-apple-darwin.tar.gz"
      sha256 "5173fcc5b115de7acfc86b293f14a506ee4cd340e35502cac5b89c6cfa749e9b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.78/meghnaad-0.6.78-x86_64-apple-darwin.tar.gz"
      sha256 "7d1ccbf5d4a775c278ee639604e77672b0b8e6a4939c939154f389bff70450b1"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.78/meghnaad-0.6.78-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1f43cf5376c71f4c5636a5862f56ad416cb1c2e35db282f8cc9d6d50f402cb24"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.78/meghnaad-0.6.78-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3fc789f57dc842238f8934707836638faef322702ed715d301cf0d90a63c8680"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.78/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
