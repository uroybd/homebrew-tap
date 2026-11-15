class MeghnaadTui < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.68"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.68/meghnaad-tui-0.6.68-aarch64-apple-darwin.tar.gz"
      sha256 "914b1f6f2ad3ec53fb58597cd081dcc90ef22c5d416caf901410a6398c73bd45"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.68/meghnaad-tui-0.6.68-x86_64-apple-darwin.tar.gz"
      sha256 "d2806f7aafc83ae3eee38accedda2288619aa6d2d1400b8f2275ef716d5ab4be"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.68/meghnaad-tui-0.6.68-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "87ded838bfadc2792768cefac1acebe2b09de8bc71e3e2a88275ba1beaa3f4e8"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.68/meghnaad-tui-0.6.68-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d3afdafff91427a10508821a3f286d645f5547fbab34ce35356754a571ee4512"
    end
  end

  def install
    bin.install "meghnaad-tui"
  end

  def caveats
    <<~EOS
      Run meghnaad-tui: it works on the tasks task reads. Its task commands are kept in
      settings.json in $MEGHNAAD_CONFIG_DIR, else ~/.config/meghnaad.
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.68/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad-tui --help")
  end
end
