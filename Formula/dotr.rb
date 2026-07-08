class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "1.7.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v1.7.0/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "a1437ac07414107ad943d3959456ff20c48c943e6b296552b17cf92f8d0fc2ff"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v1.7.0/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "b9a16bfb17efcda256825c308020e20bfa6d201a264d0b37ecd7b40ea5dcb7cb"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v1.7.0/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9c617d6907218cde8c714d04d54123fb76593410c05a9065eff61560200a7591"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v1.7.0/dotr-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "71ec3ace5ee6ea237ad21c451b402b404c2dbba0cb4cc211917dc639228d143b"
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
