class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.32"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.32/meghnaad-0.8.32-aarch64-apple-darwin.tar.gz"
      sha256 "11ede95a5b4aaf06d79a568916cd463d22d3dc95e331fdcb1efda404942b9012"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.32/meghnaad-0.8.32-x86_64-apple-darwin.tar.gz"
      sha256 "29762e17b2154cf5d2d9dcbe4f9625b27531b53bb0616a49ab9cda590ed4e930"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.32/meghnaad-0.8.32-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "170ad9e13f8ddc94341327802253b6e1ce26e4898ee11890785c369f32e4ef6f"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.32/meghnaad-0.8.32-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5ccfcbbe5aebefc7eb520ca75e7491dfd8da749c1213de3dbc5649af4c2fcacb"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.32/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
