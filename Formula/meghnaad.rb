class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.45"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.45/meghnaad-0.8.45-aarch64-apple-darwin.tar.gz"
      sha256 "cd5d90951e5faed65f149a86a49d20507910d83ea50f564a40b01ed00ec6a194"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.45/meghnaad-0.8.45-x86_64-apple-darwin.tar.gz"
      sha256 "4ba6652d5e40be9faa1c8f74aa869b2a23c7ca27e5fae3e8b6de433631239437"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.45/meghnaad-0.8.45-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dc99d7b4a281b174aa0019aba2bad4558f6a204cb806bebea9be7a42926923d5"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.45/meghnaad-0.8.45-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "109338f69b7835d9efc3656856dbee652713967884fbf5559337032dcc26eca0"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.45/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
