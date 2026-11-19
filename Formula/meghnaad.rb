class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.23"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.23/meghnaad-0.8.23-aarch64-apple-darwin.tar.gz"
      sha256 "d9a4661b14803546da933ef3dbd5b4636a1cd71534ab215c9916d16f59f499ac"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.23/meghnaad-0.8.23-x86_64-apple-darwin.tar.gz"
      sha256 "8668d175517d55015a5d22fb92ef5e44f5797b503a4fa03795a8b00e44979fdf"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.23/meghnaad-0.8.23-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ebd776164601136c5151f5b4826dc4464c015d101ee91ea9ad38fff18fc3aa74"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.23/meghnaad-0.8.23-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d0c480bc1a68175b8192c76e3f640805b710f0805853b7fa00358ec27f1d31c7"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.23/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
