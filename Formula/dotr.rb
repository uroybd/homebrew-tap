class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "0.16.4"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v0.16.4/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "d1c779211a913025c5ea93b5d25e74b00112cf69479df3d92800ce3e33e72b1c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.16.4/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "c4b14d84004a81e25a00774504d3eaf6cf39ecacdc6a8c0224f67a99a8123274"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.16.4/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b220218d130414ed624c0e9f97ecbf0e09863823c80e1a8d2c968560fd9873e8"
    end
  end

  def install
    bin.install "dotr"
  end

  test do
    system "#{bin}/dotr", "--help"
  end
end
