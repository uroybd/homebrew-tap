class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.81"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.81/meghnaad-0.6.81-aarch64-apple-darwin.tar.gz"
      sha256 "ff40ce18a97d9b1eab4db422e5669e582ee18eed4ad13ee5e5284a9efecee315"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.81/meghnaad-0.6.81-x86_64-apple-darwin.tar.gz"
      sha256 "fb5bb94605c3cfea28dca31f1ad08f5cbb1b3132cd00c5448b010d3bf2868709"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.81/meghnaad-0.6.81-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "228f41e84120ed40be23ff4eb5ec088c0ba32f3d5e366d7567ff9cea673034a6"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.81/meghnaad-0.6.81-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "12cf9ee8a730efeacd5996c236c34e1aa816d88aff31e3e7d2256c28524c3048"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.81/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
