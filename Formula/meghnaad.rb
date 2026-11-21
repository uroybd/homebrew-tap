class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.35"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.35/meghnaad-0.8.35-aarch64-apple-darwin.tar.gz"
      sha256 "df0b6eb25153dcc66f27882229caab251acc32fd9e69c9f0abafb8aa2bd6e984"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.35/meghnaad-0.8.35-x86_64-apple-darwin.tar.gz"
      sha256 "bb2d0757a044a0d9026021a2d1e518562769d35a17fe7390f872761fb8b680ba"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.35/meghnaad-0.8.35-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "976ba5aa9d336d6518586c8ded11dd096fd3b5de39120c0383e3d25177b7e976"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.35/meghnaad-0.8.35-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b0d64f41ae82afd106daf7e4e15e29d9e55ba87b4e11036a4ebd7d3147ccf278"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.35/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
