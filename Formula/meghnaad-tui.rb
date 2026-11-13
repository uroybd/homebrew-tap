class MeghnaadTui < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.61"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.61/meghnaad-tui-0.6.61-aarch64-apple-darwin.tar.gz"
      sha256 "b3cd41ff00a7200ae5ab6dea98477156cdfaeba31e580d54ef50692f76a28c75"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.61/meghnaad-tui-0.6.61-x86_64-apple-darwin.tar.gz"
      sha256 "9945cd2efec8d0bfc6baf8fea7413e29cf6f61902ad711e91ebcc41914ea4418"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.61/meghnaad-tui-0.6.61-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ba6db3ed69ed75c53952da33b3b5a8e5e8e06d4a4c3e154cd7f25ce7122b626d"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.61/meghnaad-tui-0.6.61-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7e47595ce23b9f76d449d0b5457a0f62257e0422e891a7cde047295250a42f06"
    end
  end

  def install
    bin.install "meghnaad-tui"
  end

  def caveats
    <<~EOS
      Run meghnaad-tui: it works on the tasks task reads. Its task commands are kept in
      settings.json in $MEGHNAAD_CONFIG_DIR, else ~/.config/meghnaad.
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.61/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad-tui --help")
  end
end
