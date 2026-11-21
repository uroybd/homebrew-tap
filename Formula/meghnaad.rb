class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.40"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.40/meghnaad-0.8.40-aarch64-apple-darwin.tar.gz"
      sha256 "0f08b4204e3108b5d67d9032d20ab8e8dde54b3f35b13145d0db91ef08c1414e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.40/meghnaad-0.8.40-x86_64-apple-darwin.tar.gz"
      sha256 "82f53298b0dd73884530b73668aea666f2ddbbe77028b242427931f5ffeb83a1"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.40/meghnaad-0.8.40-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "444e155b6d0dd6ba63da7f504a208c2e47164b7cc3a4cabc67d202552f15f2af"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.40/meghnaad-0.8.40-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b1b4453ac5c4838eeaf3cd61a4ea6fa02ffd4172d91fe8a2308a7a6a1b8100c3"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.40/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
