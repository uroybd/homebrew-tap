class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.62"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.62/meghnaad-0.8.62-aarch64-apple-darwin.tar.gz"
      sha256 "9c404af882658de57c4071e73af255be74264a7f7b12ba29c3237379e9f68fe3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.62/meghnaad-0.8.62-x86_64-apple-darwin.tar.gz"
      sha256 "3c703da04ddb1d653fbccccb685a1abb7db4df43012a11da15d05f0e5fd0b6c6"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.62/meghnaad-0.8.62-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8d0b9dca85e861e4fe66f719e2974992eeb3dcf7b4476f4586ef6782d6127260"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.62/meghnaad-0.8.62-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8a23e0f4573ce17b41a7a8729d0ccd6b45cd10aca8e44efa84cf897e34f7522f"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.62/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
