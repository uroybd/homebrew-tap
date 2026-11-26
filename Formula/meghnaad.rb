class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.64"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.64/meghnaad-0.8.64-aarch64-apple-darwin.tar.gz"
      sha256 "55c25d1c15a3a2edd29887102281f6c6580605a47c33b85dee95033485b176c1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.64/meghnaad-0.8.64-x86_64-apple-darwin.tar.gz"
      sha256 "097f4d97845be2ea12abcb4d60cbfeba680f7bd563bf9d336bd2977e90e13672"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.64/meghnaad-0.8.64-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8b1ff1d6b2b01cc4ea57499e4f6aa7fd8b9c62366f9f17a4c8bf7588deb4d802"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.64/meghnaad-0.8.64-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ede8bb66f2471e887f4bf27cebed501851dc0acca7ff18835c7b711c49b1062c"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.64/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
