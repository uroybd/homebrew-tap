class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.1"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.1/meghnaad-0.8.1-aarch64-apple-darwin.tar.gz"
      sha256 "c08df7af58c196df2f73dad297e2474d1329e3d807e4f6e859ed58d78631dd41"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.1/meghnaad-0.8.1-x86_64-apple-darwin.tar.gz"
      sha256 "e7b28eb6ab5fb2feb7711aa092e7e0841c296bb7728d63f0509358bdf3c2f4eb"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.1/meghnaad-0.8.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3628b97fdf001b860901265f3deaebdbaf3b0ba0637fefd46837904cb574442e"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.1/meghnaad-0.8.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4663c26a0b1758f98f9b9a1afeddbd5c51f32de17678bcfb18d0f7fb4f85339c"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.1/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
