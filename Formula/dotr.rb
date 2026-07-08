class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "1.4.1"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v1.4.1/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "4147af9f7d604841cb3c34d44245bd0b55023d863de956a2352c27ac3982c725"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v1.4.1/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "60dbfe4ba60a947c662a5fe1d6873d1da724618f9086ff89eaf7556d1177169e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v1.4.1/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "adabafe7992b90b5a113c3265d2febd23860848253117accb9679709678d1e6e"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v1.4.1/dotr-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a8b7c94a3b7aeabdcda9c4be7da350d613e37353f9f1c983cfb264f6f9bf7eb2"
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
