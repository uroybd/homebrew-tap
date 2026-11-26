class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.70"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.70/meghnaad-0.8.70-aarch64-apple-darwin.tar.gz"
      sha256 "f20bf2bd600f2bb75f271e348b202697adc75d2dc83c8b09f0c87cffeb28ec87"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.70/meghnaad-0.8.70-x86_64-apple-darwin.tar.gz"
      sha256 "32880f21b264050cbae07884bcd6049443ed1c1fb3b4eef12a277550dac841b8"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.70/meghnaad-0.8.70-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9498e09cf982a4dc018c0408fe96f070708b2959959f0aea02daa193852a7cb1"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.70/meghnaad-0.8.70-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "05a4547b512b0f6ff5b77f6c3d33f1417955900e824cd4b7bcc7d3c30f6b7e19"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.70/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
