class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "0.16.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v0.16.0/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "f966853986904046cb3a27cde62ec4aaad530f6b96b0762151adee257b0a594f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.16.0/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "6de89f3f37bead08e57f5da5ca9318b30f690b2ab9a01988be27b2693dd25f12"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.16.0/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a4199f27481b802d81b4fea5b93ffa37d1e8601c67acf2dfa36e63aa639d59b8"
    end
  end

  def install
    bin.install "dotr"
  end

  test do
    system "#{bin}/dotr", "--help"
  end
end
