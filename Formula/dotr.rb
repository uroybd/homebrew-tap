class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "0.25.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v0.25.0/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "a0c64a4bf9d0dd896d879b4f80f27c1020a8030f488d4c10e7327847185c2b5c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.25.0/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "4a89221cc0f71d32e1d66acf306d7c10d9cfb96fc89996c8bff940d17d08b178"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.25.0/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1ea88d7324931beef75160441d46c4313949346f1f9800191924130e43e3b5a3"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v0.25.0/dotr-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bc630a919513c1793abe363f87418772a10f573535e24e06f9401de36ca6e13e"
    end
  end

  def install
    bin.install "dotr"
  end

  test do
    system "#{bin}/dotr", "--help"
  end
end
