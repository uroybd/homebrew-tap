class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "0.15.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v0.15.0/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "aa110246819a1f600616367cb29a9b144b382d51c538200df33b1a11babcd185"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.15.0/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "57a3d61e6c2d55832d4daa4cf0f2f8fd34800ef1d97ac035c6c23c86eecb654b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.15.0/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "42a94eac6eecf954e0ff91f8627a9e498bd93d053bbb6faa0de6ba8f6c7a4937"
    end
  end

  def install
    bin.install "dotr"
  end

  test do
    system "#{bin}/dotr", "--help"
  end
end
