class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.3"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.3/meghnaad-0.8.3-aarch64-apple-darwin.tar.gz"
      sha256 "a54f596602b890f96c5021f3a053c8424e50abca9df7a9737def0d19fea35173"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.3/meghnaad-0.8.3-x86_64-apple-darwin.tar.gz"
      sha256 "a1295bd06452b199ddb7804748a8973093fc31f05427b9a84bc7192177d5a95c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.3/meghnaad-0.8.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "abab98578bdcf8b43f14cdcbbf36fb681ac72c5a9d1c6f83feb659c86ab27973"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.3/meghnaad-0.8.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "60cf105bc44d1cc68d06b3ff9c14ba10a69a19ee45525a1151982cba74319399"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.3/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
