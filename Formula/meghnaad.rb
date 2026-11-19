class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.14"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.14/meghnaad-0.8.14-aarch64-apple-darwin.tar.gz"
      sha256 "b098b8e8c8eda8c7d4b8cb6d7425081d42a23f47a1e5515e10ffd2885eabc3c7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.14/meghnaad-0.8.14-x86_64-apple-darwin.tar.gz"
      sha256 "23beb4bbb61d164d25803603cf7a1b30d076472d89d612e2719596943fa7ecff"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.14/meghnaad-0.8.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fd8b632ad0d40202fcc972a9d8524b37051f8370f5def8105af2e2ca8651b263"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.14/meghnaad-0.8.14-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "24c49054c48979bc581c2141229c82d5e3f0f74945b6c5060e69ec2559cc6e15"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.14/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
