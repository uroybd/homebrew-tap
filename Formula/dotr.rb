class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "1.1.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v1.1.0/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "042b6cc0593cdf241f890510986d3c517789189f8a8eb783922f78fa15799c0c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v1.1.0/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "b050a6f1670f5925f2c6d6678f5c0b620f86951b87e9a9c6dd216e2d90fb8b08"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v1.1.0/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5e8e0aa251eea82f9cadadcde1f3925bf9221d0b301702a0105fca4aa6dbe3b1"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v1.1.0/dotr-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c0a3738e191f1af31675902f4b16397ae3ea3824d2d3fdb5a4fdb5d9e6cae514"
    end
  end

  def install
    bin.install "dotr"
  end

  test do
    system "#{bin}/dotr", "--help"
  end
end
