class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.27"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.27/meghnaad-0.8.27-aarch64-apple-darwin.tar.gz"
      sha256 "f1fb2c798e1468f7e199ae0efd1ef3a41ac732329753a10f87f513e9f0a398ed"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.27/meghnaad-0.8.27-x86_64-apple-darwin.tar.gz"
      sha256 "138aac10bfa8af3ed983ed6d64d8c3de4d8aa19b7eb0b4a1d5a5aac867577c95"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.27/meghnaad-0.8.27-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c9ceb07bb2b766c7090b517067ef60b87a40d8a9f65bd11e8013d948ee3e9488"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.27/meghnaad-0.8.27-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "de87f910c8ddefe72f8039b0c8b90ccb39378f6537005a3e48d5e2e45493faec"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.27/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
