class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "0.12.5"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v0.12.5/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "8b1b36a547af99d46f70aaefc9aab7401ee26f80efb699650bec6421bf047247"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.12.5/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "a5df415e7dfdb632b0476e75331e5fc075a340a1a283a9769066045a467d0630"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.12.5/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ac77e4408c70cf3d4ae918d02ac1808bcbfcfba78f41b0f8c9f0d600f8b307f6"
    end
  end

  def install
    bin.install "dotr"
  end

  test do
    system "#{bin}/dotr", "--help"
  end
end
