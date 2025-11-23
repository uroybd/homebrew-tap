class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "0.18.1"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v0.18.1/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "e1423abf4d14b0a208684d5658e9e1ef5a20c6b2e2e310381b2f3c1c6f20c315"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.18.1/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "6a8bcc66d18d0d75dc55e1e7da3f78a39585c478af72411fae38458838ab8435"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.18.1/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bbe3f5b885feac31ca0b351797b1c0f5a4527c0e310c25fdce0db4c727db2de9"
    end
  end

  def install
    bin.install "dotr"
  end

  test do
    system "#{bin}/dotr", "--help"
  end
end
