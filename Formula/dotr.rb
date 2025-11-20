class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "0.10.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v0.10.0/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "bcd73c1d36718f7efe7f6960e41e992f6461f2ed0301724dc02ca395be51a302"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.10.0/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "6520335d4a93326b0ed8e2cb107d4c126c1f259e81fb6ca61e8acdb3dc92c6e0"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.10.0/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "10f0fcf3db0f6ba65e3f38d1a274d3ae10cc184d781c6fe785de2db1865f7c97"
    end
  end

  def install
    bin.install "dotr"
  end

  test do
    system "#{bin}/dotr", "--help"
  end
end
