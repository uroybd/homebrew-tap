class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "1.4.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v1.4.0/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "ad9761a30d291d93f5c31e1457de9f3b28d3033c28cb28382949f4645a7cecde"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v1.4.0/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "98d229729e74356eee23fc6f86c9bada4a4654c0bcf24ea61e0594c709514ef4"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v1.4.0/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2204a514425f7d75abd9890392998316bf0daa5c2425f4b2e5431c022ff659a3"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v1.4.0/dotr-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b9536fefda0daea20a768662cd2865c58a98678b4ef9ad03219fa5b65287d927"
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
