class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "2.0.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v2.0.0/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "d444c7d9a13f4eeaef57f5289906fa732fbdb0c8d6ad95ce65b47f589e883fe2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v2.0.0/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "3609386cf4f6624567fe20216e7aff62c499a49dbbfe92df2bd2990ca6b45a37"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v2.0.0/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ed515a29a73d216f4dd33fc4fd01cbb0622c418ba44834eaf415ecf5e5ae7f15"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v2.0.0/dotr-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c48b49b3c5c1c9f5393069b8a738583c10d4082a98095c720d424422fcd33532"
    end
  end

  def install
    bin.install "dotr"
    man1.install Dir["*.1"]
  end

  test do
    system "#{bin}/dotr", "--help"
  end
end
