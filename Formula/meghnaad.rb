class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.63"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.63/meghnaad-0.8.63-aarch64-apple-darwin.tar.gz"
      sha256 "20ccf3287dac3cc26cb495e0911b317b017af22f3aea571306954748a3745cb9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.63/meghnaad-0.8.63-x86_64-apple-darwin.tar.gz"
      sha256 "f7ef968d3d5fbae4434d60001a35bad35e47888ea55e645a5154d85d8aede9d8"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.63/meghnaad-0.8.63-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "831e5c3e6a7b8d602271fa5b3e00e8f0414f5607d193d7f7a11116a211b7042f"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.63/meghnaad-0.8.63-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "459cf95d8e46ab3d3d7dfa794d42e474523016e85294922a00c183429e178847"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.63/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
