class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.60"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.60/meghnaad-0.8.60-aarch64-apple-darwin.tar.gz"
      sha256 "467656f690dd2e71d0d63a25794a054677f4434de19344b4bc6368557b9a0eb5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.60/meghnaad-0.8.60-x86_64-apple-darwin.tar.gz"
      sha256 "676f8136ff3c25dfb6d29356488555fb52b41353c67ab64d3480252ec9d2360d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.60/meghnaad-0.8.60-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5bfaebb9f7062e3c76ca59cdf272502d08c7d9400b68f907bb40686ab7c63fd6"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.60/meghnaad-0.8.60-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2c110b689a6e29a8f591d650b94ad53f0339b5c5199b8c8b3e747e6cc25592d7"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.60/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
