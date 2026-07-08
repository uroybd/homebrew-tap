class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "1.9.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v1.9.0/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "a456122baf3aff38d344a746d416eaa1162d9eb79f0ce3c0c1aafc5a5eb0f6ca"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v1.9.0/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "d610caa977debb8695656d4226782ceca0e4fbb8cab9cc81202c0d1f83c0d1ee"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v1.9.0/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a9aea5d72b1ad34646988a0d7250588b1abf95696f009d304948b979d199ae3a"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v1.9.0/dotr-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "840e26cccc3e173556d0355d476c40457900309766e2d21366943a75564473a9"
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
