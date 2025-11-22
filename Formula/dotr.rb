class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "0.16.2"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v0.16.2/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "9b1586372c113da105e8bc620d1e262d63dd958ad6686164294ef8bab34fedcd"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.16.2/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "b867d01aa2c9e4c15b34c47bc5088c56ce789ec913b3552d4f10e960a7e644c9"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.16.2/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "690e1660b2e146b9034de654c4ea497f6705711b6c4a4126bb8a9551b09f6e59"
    end
  end

  def install
    bin.install "dotr"
  end

  test do
    system "#{bin}/dotr", "--help"
  end
end
