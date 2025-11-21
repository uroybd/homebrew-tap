class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "0.12.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v0.12.0/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "485db393e9181d44b8f0118d862fcd909ab1024b5b6058e35e9f6fd99ec834ef"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.12.0/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "637d2c4055f0b7196bb81fd3bc591e582135b5a192c34d5fdb71584d6fe7e314"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.12.0/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a1c40dbd4eac6900e3c0c53d26f9c22dbf8fd7840c73d748bd5b8f1a3301d48e"
    end
  end

  def install
    bin.install "dotr"
  end

  test do
    system "#{bin}/dotr", "--help"
  end
end
