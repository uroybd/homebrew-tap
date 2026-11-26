class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.68"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.68/meghnaad-0.8.68-aarch64-apple-darwin.tar.gz"
      sha256 "16eafb7295193f071999777f706cc4972b29253fc35748eb82cbeb9dcdd8c693"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.68/meghnaad-0.8.68-x86_64-apple-darwin.tar.gz"
      sha256 "090e8bd17ea0078f43f8920aff1de123a586665affd926041602a107b60e5ac0"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.68/meghnaad-0.8.68-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f84a2273fa97165a307766bec2213b64ab109bd79ac46450b53ad0ae20d77f72"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.68/meghnaad-0.8.68-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7df8e7f6ecc80ec0d1a45d9f648864fe5c88aba0e9f82a72ab0929e35ad76ed9"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.68/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
