class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.66"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.66/meghnaad-0.8.66-aarch64-apple-darwin.tar.gz"
      sha256 "c4dac14a90f400f0117f87da011e97f2e387017987bfcdf87623bf2ebac7a0bd"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.66/meghnaad-0.8.66-x86_64-apple-darwin.tar.gz"
      sha256 "d62008e9071aaf6d05bac6bda04b37a11ff53cb6224f9ca046f1dfa8c30f07c3"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.66/meghnaad-0.8.66-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7ff78b738fc246d8f33b808b6d1d688e325da7c270e811726d41c69f89da9df5"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.66/meghnaad-0.8.66-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d2abddea29dfc51269a3608cacff766fd6d5c8a5953ef451d7404eec19ef560c"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.66/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
