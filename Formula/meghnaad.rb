class Meghnaad < Formula
  desc "Meghnaad in the terminal: a TUI around the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.82"
  license "MIT"

  depends_on "task"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.82/meghnaad-0.6.82-aarch64-apple-darwin.tar.gz"
      sha256 "fe45fbe795ce2ed671bfea8f53f02ecc4ccdb4703e98f5ae41d4b886254f4dd3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.82/meghnaad-0.6.82-x86_64-apple-darwin.tar.gz"
      sha256 "42bccf4a8d8e23de55f1107c7537520e8ce44a3a1d76676a2b621b96100dff25"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.82/meghnaad-0.6.82-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a2f57ca0bd02bc60c7b5fbc38e4995bd99eeea03680e422f80d666857bffc5aa"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.82/meghnaad-0.6.82-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cd73ae237272c76b78ff419d2122dc4af8a766fa4352d8d9ca834c71c4b37823"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.82/docs/terminal.md
    EOS
  end

  test do
    assert_match "Taskwarrior", shell_output("#{bin}/meghnaad --help")
  end
end
