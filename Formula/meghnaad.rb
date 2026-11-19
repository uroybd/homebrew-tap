class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.12"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.12/meghnaad-0.8.12-aarch64-apple-darwin.tar.gz"
      sha256 "422f414821dcff374fb905c930fdb71111141218febec4b4746e4d91fe029ada"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.12/meghnaad-0.8.12-x86_64-apple-darwin.tar.gz"
      sha256 "1fb9d2cacacb0a069a8034aaab6c5613fe5014247b728d2af4abaa486d8acc9f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.12/meghnaad-0.8.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bdac8edf88bdb4e4f82ee08cee255461b87747391679dfc82ad59d9da183859d"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.12/meghnaad-0.8.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d2883557a73e81280012d0f18fcef64b596b9d036d19d3cefdf61108577334a0"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.12/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
