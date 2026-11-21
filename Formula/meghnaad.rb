class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.39"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.39/meghnaad-0.8.39-aarch64-apple-darwin.tar.gz"
      sha256 "054ff36ff55c35bab8a3b30cef378ff5638f61926a8f4f890c501f73a2f7cf94"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.39/meghnaad-0.8.39-x86_64-apple-darwin.tar.gz"
      sha256 "e775732987eab7c103b34d63545a120b02aa71793a86b3ff79514aa3848cecc8"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.39/meghnaad-0.8.39-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "eab07c3e4255e9f15715c10c1d888086122e6d7dc95dd76021e33a61591f30d2"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.39/meghnaad-0.8.39-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "02be654e71bfaa1abfacae785098b46f0881782ee71c3528a2c0f25c6fbff95d"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.39/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
