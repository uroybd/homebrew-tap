class MeghnaadTui < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.60"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.60/meghnaad-tui-0.6.60-aarch64-apple-darwin.tar.gz"
      sha256 "505620ca881e44394a9fb6200f9762cb3525ce32edd2a4756af5eeeb8256598e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.60/meghnaad-tui-0.6.60-x86_64-apple-darwin.tar.gz"
      sha256 "1f75ccf7669f2ee7f6c8335790015db3ed3435985dfb392729f826b22f430a1a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.60/meghnaad-tui-0.6.60-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "34833b593bbf785f7f9322144d8fa90237fac35c68312b65edf8cb33d2a7fd1d"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.60/meghnaad-tui-0.6.60-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a5e3e7c28a2cada659d2389712197d96625594676c45e019376a96eb3c383bf3"
    end
  end

  def install
    bin.install "meghnaad-tui"
  end

  def caveats
    <<~EOS
      Run meghnaad-tui: it works on the tasks task reads. Its task commands are kept in
      settings.json in $MEGHNAAD_CONFIG_DIR, else ~/.config/meghnaad.
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.60/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad-tui --help")
  end
end
