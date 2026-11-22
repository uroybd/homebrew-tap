class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.46"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.46/meghnaad-0.8.46-aarch64-apple-darwin.tar.gz"
      sha256 "11a0783d90ca51686e1f57511b6bace134b8f878c2da97d343aadebfcb5b63ec"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.46/meghnaad-0.8.46-x86_64-apple-darwin.tar.gz"
      sha256 "2e56274ab5d1b612f696d8cd7d4000587c596f87fb5f4fe9a76e10cad03bd9b1"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.46/meghnaad-0.8.46-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1c01b4389ae40fb41dc5ca0113811e0aabfe1ee8f355dd52490d60fa126dcef4"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.46/meghnaad-0.8.46-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a453ef1ca47012482b78620cb98910cbe57df6838f59359c8d97877fd86b6695"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.46/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
