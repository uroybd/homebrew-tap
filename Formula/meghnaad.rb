class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.54"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.54/meghnaad-0.8.54-aarch64-apple-darwin.tar.gz"
      sha256 "9d3d09ce1aa07c22c054599189f64e2cc16ca67f6bbc0852a1b6665ec4183e5c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.54/meghnaad-0.8.54-x86_64-apple-darwin.tar.gz"
      sha256 "a7b127d6a29ea0947d5695176b71075a40dd6bd5fb036ab70c0ece38c0886a4a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.54/meghnaad-0.8.54-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "de4e95f5ee8c29c28f5dd5c0566ceef5c44d99f8c3d33a9d6e02d504b025d0a5"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.54/meghnaad-0.8.54-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "027e058044fede2a4f493ba6a1427d807f1a4a7d78ff7ddf14a6ddd9a77ceb94"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.54/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
