class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.67"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.67/meghnaad-0.8.67-aarch64-apple-darwin.tar.gz"
      sha256 "1e2d61dac94781518320038cd16f7f414f1ee2ea4ee3593921da5c668c9ae887"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.67/meghnaad-0.8.67-x86_64-apple-darwin.tar.gz"
      sha256 "d3555bd46d6217b5eb40bbe06b3b0b7e2aceca97ac9eabd2d7e9be4068b86c6c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.67/meghnaad-0.8.67-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8c9fd8116fd3b6ac6025cdd9431db648adc9e8256d824db5f0617ba7b86b099b"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.67/meghnaad-0.8.67-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e1ea192c18e6203d5ec5a2850596c1cf36344ce19022db56a6d97f4f9a2bcf87"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.67/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
