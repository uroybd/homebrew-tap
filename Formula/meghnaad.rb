class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.10"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.10/meghnaad-0.8.10-aarch64-apple-darwin.tar.gz"
      sha256 "e86aab83ed3672e61592e0e39080a58c031a5ea93882b5eda45081822c477137"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.10/meghnaad-0.8.10-x86_64-apple-darwin.tar.gz"
      sha256 "8226825eb2daf77a63319d50f01033269c1514ac3a6a663f36be0e474eb46ae2"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.10/meghnaad-0.8.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "379c5087ac96641dc1ea97cfdeaf50c0e02be0d6fce2d34e6443fa44d92d920f"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.10/meghnaad-0.8.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "77c1337e416bd36fc1d32d73cc7a9a971b30f8e6e9e4e68f82254bb4f6cec4f4"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.10/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
