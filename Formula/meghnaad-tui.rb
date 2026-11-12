class MeghnaadTui < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.55"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.55/meghnaad-tui-0.6.55-aarch64-apple-darwin.tar.gz"
      sha256 "bea226fcf07dd0081f9ba6e6eafb9cfe2252996da059a8bb1d6ba0629ad7cfb7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.55/meghnaad-tui-0.6.55-x86_64-apple-darwin.tar.gz"
      sha256 "b4604e11f715e3b30a68127dc7ff4b033a7604c03b6fdfd477e8b441310f45ff"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.55/meghnaad-tui-0.6.55-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "258903a05f70f182f483968602fa07a3883015a3a5d39799ee51bae701371e10"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.55/meghnaad-tui-0.6.55-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c7be8d54b83431aac9752f935dad4c9aaa2245c53d0995066c603b164392ed89"
    end
  end

  def install
    bin.install "meghnaad-tui"
  end

  def caveats
    <<~EOS
      Run meghnaad-tui: it works on the tasks task reads. Its task commands are kept in
      settings.json in $MEGHNAAD_CONFIG_DIR, else ~/.config/meghnaad.
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.55/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad-tui --help")
  end
end
