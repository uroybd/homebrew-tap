class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.7.0"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.7.0/meghnaad-0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "bc411825ef5663740b7cdf13394f23e06d37025862be00ec20528e6b17d65f71"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.7.0/meghnaad-0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "1c6d0c59213d2c9c73af306c8db01528288b8ae805d7384a2815c51504b14572"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.7.0/meghnaad-0.7.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f992f873ad83a45030c1ed9aec7f652827c94aec370574bded0c58d31aa39430"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.7.0/meghnaad-0.7.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4ddc8e7e510711d9327b7f5036fcb8b83155ce18378fe501e7f402ecc9a3e001"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.7.0/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
