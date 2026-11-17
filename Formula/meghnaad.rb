class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.0"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.0/meghnaad-0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "07fb78447c72ab953276078b282997b8d9b61df7b611f207d1f7cd8ed823a37f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.0/meghnaad-0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "b6f0d98f1f2a7af8bcc158587fd53a1aa6a96c3c811aacd1c19e875658213281"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.0/meghnaad-0.8.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4e08e4b3c539843111f35953b56fe89c98778fd24c5dcc54cca1aa51c9da2f7e"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.0/meghnaad-0.8.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "51537611e7a9290dd77bee4ed8a5c8682e158aa890a76c8673a3e3749bddfbec"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.0/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
