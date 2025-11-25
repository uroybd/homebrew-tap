class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "0.22.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v0.22.0/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "7ebf5242498d289ab73b30340fe7d42956189b65303cfcf496de9874de067a9f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.22.0/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "311dacfd549207f8f5d801d4193e4371878dc9a37049dd3bf1739b750514e752"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.22.0/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a8174df793fe37d899cd9285db322e199d17727b95972be83b0b2f0ff4e55ec4"
    end
  end

  def install
    bin.install "dotr"
  end

  test do
    system "#{bin}/dotr", "--help"
  end
end
