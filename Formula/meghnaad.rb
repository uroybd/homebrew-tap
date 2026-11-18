class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.9"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.9/meghnaad-0.8.9-aarch64-apple-darwin.tar.gz"
      sha256 "20e98edea7ac4093c56f57decfe26b927abaeb6db59304634fc8d368afb35fe3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.9/meghnaad-0.8.9-x86_64-apple-darwin.tar.gz"
      sha256 "a7e46defe9344807a5a86d49a03fcd59cb08ec22d4281db543d5c1368eb3ba86"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.9/meghnaad-0.8.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ef9877cd5d3563752875032cef223788df586ff7f5d72a9d4b423959473e61f5"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.9/meghnaad-0.8.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a7a9d18602098e1a50070ca89f8b1e250a7c9120c81092482aec1ff307e87861"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.9/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
