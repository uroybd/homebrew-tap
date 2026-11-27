class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.73"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.73/meghnaad-0.8.73-aarch64-apple-darwin.tar.gz"
      sha256 "6585e52faccf54dff9e13f3b9a10ea8648229370de407c281eee86c7ef1dd5e0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.73/meghnaad-0.8.73-x86_64-apple-darwin.tar.gz"
      sha256 "737086c1ee073b490786073388c3ff62df133cb88f8a836735b9e9257d61bbbf"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.73/meghnaad-0.8.73-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5a13554bf522118dac7c60631065b4f61e218ebe635dac51c3b27ec06512e295"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.73/meghnaad-0.8.73-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b75b819d108d0d6eb5d40795ff181f15a97c14bcba73deeb88ce21de7a85cae8"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.73/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
