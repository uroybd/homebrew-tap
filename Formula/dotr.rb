class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "2.2.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v2.2.0/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "9d2746a312699caa44b3c5af752d5830066fd4d29b0c8a06869beff570059c37"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v2.2.0/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "3a7e14e9c55fdcd0c082dd57afebfae423744c630b033d0e6c61c5e3b2f3f0b8"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v2.2.0/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "926ca50d2f522637b2c2e3a50602216a899782a3493752e1ea56e307af54dcb9"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v2.2.0/dotr-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3c68ab1296942fe938cd4e654ad760d6a3049ef527b56fca377fd5fccb2914bd"
    end
  end

  def install
    bin.install "dotr"
    man1.install Dir["*.1"]
  end

  test do
    system "#{bin}/dotr", "--help"
  end
end
