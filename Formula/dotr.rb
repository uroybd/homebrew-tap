class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "0.14.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v0.14.0/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "459bb79f6aa31020872aca77fe2fc10e6632eed10c0f60b04df92d6f177094ad"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.14.0/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "29d78b7bd0dd27a9c1f25b3b1c6ca175fd3b3f0526797b129525e61394ea385f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.14.0/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1e41e03ffa4695fec937e1898a66722c2eeba2e3f6400c7cd4f21d008e024ea1"
    end
  end

  def install
    bin.install "dotr"
  end

  test do
    system "#{bin}/dotr", "--help"
  end
end
