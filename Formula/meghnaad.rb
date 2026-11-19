class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.19"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.19/meghnaad-0.8.19-aarch64-apple-darwin.tar.gz"
      sha256 "8255c7486be40905bcb41a0734e11049dcc068ec6fc2dec77dcae7e5a3123a44"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.19/meghnaad-0.8.19-x86_64-apple-darwin.tar.gz"
      sha256 "65ef4c5003631b0679d9838949a40edacddb33018c3798b98390a9fa3308dae5"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.19/meghnaad-0.8.19-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "23ae73dbcbea061d98ca0c7c525a44b6cc4ab233c662ef1765f0926bf0ab8afc"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.19/meghnaad-0.8.19-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "96bd25628f449a75b9f47d12f81d42e468e38ff73d142cba4f2d69426e4054d7"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.19/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
