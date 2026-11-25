class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.61"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.61/meghnaad-0.8.61-aarch64-apple-darwin.tar.gz"
      sha256 "cc737197eff1418055ceecfb7f93f86aa5de4754f08f540b6107cf8efe6388bd"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.61/meghnaad-0.8.61-x86_64-apple-darwin.tar.gz"
      sha256 "d8703e3a6eedf4bb2f3429798536e1ac9c2e53a2967dd44c4db787666f4abd12"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.61/meghnaad-0.8.61-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7e6395dabe5eeaf4c196bf7d5ed3bf2a308fc573033f3445842f8abe33ef15fa"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.61/meghnaad-0.8.61-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e19c1e37f1d1d3f40a1a84168bada8fd6ff0637f0705fce84f3dd64fc52ea5d1"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.61/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
