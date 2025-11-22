class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "0.13.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v0.13.0/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "f7dd62ef0d40688899012b33d4a234c53445bfdfbfa8975886bd967eb6cc8998"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.13.0/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "29b363e111c7e7c0d8b163707df4a7868bed4478c553d18d98dbd434824d23df"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.13.0/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "69073afd54c172a2832fa6a96ee103a0811f5f309bc3c7fe2575557105b657ce"
    end
  end

  def install
    bin.install "dotr"
  end

  test do
    system "#{bin}/dotr", "--help"
  end
end
