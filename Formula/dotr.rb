class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "0.8.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v0.8.0/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "a4beb3b842a97236620b42f3a42a38e9536f440933d4df23b332cda7a94d3f08"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.8.0/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "2c2e77e16ddb10abf82816a0c906416e18963702f044d44776673ecf97cf88e6"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.8.0/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "08bbe20ee6249fd96695b93ba4c28e928b79f33357a7166f633fa3a436045875"
    end
  end

  def install
    bin.install "dotr"
  end

  test do
    system "#{bin}/dotr", "--help"
  end
end
