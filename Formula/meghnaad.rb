class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.47"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.47/meghnaad-0.8.47-aarch64-apple-darwin.tar.gz"
      sha256 "38f37e3b05a28e847301d1d12ac0fb6f25a215efa7252f352f1fd490a7b458e6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.47/meghnaad-0.8.47-x86_64-apple-darwin.tar.gz"
      sha256 "9d64db0527452c41a9295d24e51e7224dd739d8ef1abb5ff6f4fe9d060650161"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.47/meghnaad-0.8.47-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "546e9243d11ec5d2e9d6b25b5d326b9a2245177979d368ba28da50e463b2e49f"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.47/meghnaad-0.8.47-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9e741d0405b021c689b93aae3de30f1a1bb7b39264488db8a72febc92c0b4295"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.47/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
