class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.41"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.41/meghnaad-0.8.41-aarch64-apple-darwin.tar.gz"
      sha256 "34669fc05925e06063d3f64a505a7937bfe84e404e3690096926011c142d7998"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.41/meghnaad-0.8.41-x86_64-apple-darwin.tar.gz"
      sha256 "0f3d6da46ccd0cb1c9ecb4c966d1c2a9b4f75823864b9efa2bd72a2407aa3c15"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.41/meghnaad-0.8.41-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0ef25c32625541f21c5c8d43b7ef52c518dcfb5853d99a125d9f82c2c4eb262c"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.41/meghnaad-0.8.41-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5ade1f1a26c582ea82a4db21b0d4d860584ef234fab87cbc341d2a93b29dddc5"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.41/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
