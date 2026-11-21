class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.42"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.42/meghnaad-0.8.42-aarch64-apple-darwin.tar.gz"
      sha256 "6ca9968e5fa166475f09bad06627e4a7762c2db01fc73db6989be01086aacaab"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.42/meghnaad-0.8.42-x86_64-apple-darwin.tar.gz"
      sha256 "45c267f36cf3d0caa8d34117cfd8192bec3f20941d5572ac4af0e6dd505e7ad0"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.42/meghnaad-0.8.42-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "04c231949af17b229c59aa2785ec0314c60a459aec7ec587cc6032a1c7e14fc5"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.42/meghnaad-0.8.42-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "790f4cb9b222eeb995b18ff0d9f986c1beab16a729025072b7d78e81a0883e52"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.42/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
