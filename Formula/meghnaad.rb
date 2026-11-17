class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.7.1"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.7.1/meghnaad-0.7.1-aarch64-apple-darwin.tar.gz"
      sha256 "f6d47c3e26187039f747857ace5764647b281c0a6bfb195ec26fc989667a05fb"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.7.1/meghnaad-0.7.1-x86_64-apple-darwin.tar.gz"
      sha256 "e71341a5b4f4695cb8c5a100c537c7d683dcc2de823bfc2446c6a22a0dc674bd"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.7.1/meghnaad-0.7.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5cbb550c5c53aac9ba629082afbb8bd3cacd8e9208f3fe95c06fc5b36fd36af2"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.7.1/meghnaad-0.7.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a1cd48655607f5c28958251cf0bac99f420091faff9d20fb08c6f515aa0cbef9"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.7.1/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
