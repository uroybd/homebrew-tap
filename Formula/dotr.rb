class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "0.12.1"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v0.12.1/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "fa26b0cf9445c843f43e5a52ee6f39fb527b031179fc6a7b0ec97fc6e7e94609"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.12.1/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "63f395c294c35d7a425284aea3bf3696741bcd695d7c5f8f4a492f60083d9ecc"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.12.1/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "15aedd258714301feb1f96c8c66052a55829598dee3c836a5fe600ac35a2dd20"
    end
  end

  def install
    bin.install "dotr"
  end

  test do
    system "#{bin}/dotr", "--help"
  end
end
