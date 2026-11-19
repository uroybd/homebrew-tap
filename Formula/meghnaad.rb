class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.21"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.21/meghnaad-0.8.21-aarch64-apple-darwin.tar.gz"
      sha256 "82c032bfe73959727b5e5eb94808a9ccfc9e1b523526e4eb5b66b9825fc39219"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.21/meghnaad-0.8.21-x86_64-apple-darwin.tar.gz"
      sha256 "743754da5c9aa1cdeb5100bbdb657fd7616376b831bdbc0f339a43a3cf033bd8"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.21/meghnaad-0.8.21-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e7601dbead8e23ddb19256856d5d30cd4c3b661387911bcd300e075570396526"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.21/meghnaad-0.8.21-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "89301f8a5a631882a16368e016746f32aad324e28232903319f04e5b518899f7"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.21/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
