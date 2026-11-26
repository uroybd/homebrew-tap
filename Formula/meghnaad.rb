class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.65"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.65/meghnaad-0.8.65-aarch64-apple-darwin.tar.gz"
      sha256 "8524ac2533f51aa6ae818f160d6b3abd52c5ec563faffa82a8ad440391c5a4aa"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.65/meghnaad-0.8.65-x86_64-apple-darwin.tar.gz"
      sha256 "a5de71b0fba6549f619f119e35ef3bbe1c8f01bf4680fab8d7da55fa7712bbb6"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.65/meghnaad-0.8.65-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3339e2d5979f928bbec57c87c822b5f03a1aa45afee262defb48e13c8ea1684c"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.65/meghnaad-0.8.65-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e521d4c4d077f98d20726fd67881fdb638fe0febd50623a32c24d6da4b633ca0"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.65/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
