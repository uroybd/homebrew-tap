class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "0.24.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v0.24.0/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "8130e4afce034b165e29ce6fb974eb17307d05893831715c0d842bb4782fcd45"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.24.0/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "bca1004b6121c75f26757184a368bd9a19b14832d719e9835de772ae8294c83a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.24.0/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3d871721253fa05bd0031effb79595fa60a4cc1195a9f3969871e53fc387ee51"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v0.24.0/dotr-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7081ae348783424ac3df6b949a5ee5a0147c64213ed35e7b0cd38069e430eb4e"
    end
  end

  def install
    bin.install "dotr"
  end

  test do
    system "#{bin}/dotr", "--help"
  end
end
