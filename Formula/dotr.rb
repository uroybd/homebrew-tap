class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "1.0.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v1.0.0/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "2ba1e144a889ab0b57c31cd3a4d90dc51ad3a8c50422cd479763e637d8eb418c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v1.0.0/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "2a6e3e18f823953981269bd8c78ef1e9aa5bb7e4403dca8454c3e7045fb698a7"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v1.0.0/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "befd567374bb6500d6ed8fdc15199789885e08d33ad22bcd552ae3f33b62697f"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v1.0.0/dotr-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b2929352fa87f78db1fd93fb60d40ff9a91990d78f667979350633adf8fbb1f8"
    end
  end

  def install
    bin.install "dotr"
  end

  test do
    system "#{bin}/dotr", "--help"
  end
end
