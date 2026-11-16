class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.73"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.73/meghnaad-0.6.73-aarch64-apple-darwin.tar.gz"
      sha256 "6d3c1c4eba2773289cb5823f585b1a3c3034249284200762d7c41b2b3d4a8927"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.73/meghnaad-0.6.73-x86_64-apple-darwin.tar.gz"
      sha256 "5099273f3705e559844118c602966d0a856ff27630007f366e008c3e464291d1"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.73/meghnaad-0.6.73-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d35af018eca366cef35817a3f9ca99885f6f572e74c03be9c28a1ba44d5185a7"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.73/meghnaad-0.6.73-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0dbeda9a7433958046edff55c6c4c8082e29c6bd48121c6aee3867c3433c53c8"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.73/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
