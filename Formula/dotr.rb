class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "2.0.1"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v2.0.1/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "731e0a79faf0239e420da4021f830a2cefbc8d314f902d12b5317a4c1ac3cfc5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v2.0.1/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "2d95682330cf26119c5f7d8f9ca25ea27ca35107eea838a719aeacc629fe498f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v2.0.1/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "075a24f0f60d86ce734ae1934eba5b871c880d1e5b50be8a6dd3de98d167466a"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v2.0.1/dotr-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ca5b8beae7b805f2419eefe9955ba0a9efafd83c6a676bb5eceb0ee12eb83290"
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
