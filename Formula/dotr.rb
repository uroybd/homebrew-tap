class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "0.22.3"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v0.22.3/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "f5fa2e758d41c694c999dc0a052bf78022c9b4919b723da10c783e41b4cc7f82"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.22.3/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "c772722e0ef380fbeed16d7349827aaf636bb68bfc837374428981b11098ddca"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.22.3/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7102ac0b817ebc8aa643db60f19209b7dc0f1068cdb07f3307258dff7b6097e7"
    end
  end

  def install
    bin.install "dotr"
  end

  test do
    system "#{bin}/dotr", "--help"
  end
end
