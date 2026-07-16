class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "2.1.1"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v2.1.1/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "59a2a88953367148ca9c0b862208b3a6abad7b9945dc227d35a0757eb6b97e18"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v2.1.1/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "73f6e7bff56b15f5fe0efd0582c5cc10323f3777bd7057bd35bf32d5f2a5fcfb"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v2.1.1/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fabed81d1f56e896aaad89b020cabb50bf0d82911d2740974daa1e7c27408e2c"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v2.1.1/dotr-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3d777e83a8f85a9a373a67319cf888f3a84626d65437a80c2be2828c9d36033d"
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
