class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "0.20.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v0.20.0/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "6eaf2f7796611d53d79000cfff9251348468babc6400577b87bc9f3c58340464"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.20.0/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "e803c198b71ef52f68bf3dc11031cbec1b1bfe3167d2ce9ec83d41af1a0253e1"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.20.0/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "32b1e72abc7d7135633153be4e0ffd37fa34e28aff16544e2a665061d7146ef8"
    end
  end

  def install
    bin.install "dotr"
  end

  test do
    system "#{bin}/dotr", "--help"
  end
end
