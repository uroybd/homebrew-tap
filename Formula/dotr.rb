class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "0.11.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v0.11.0/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "0d0b394752d9a91f775776549bcfdb596afc218d4f3c5f90e2738e99d88c4566"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.11.0/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "9d7f3bb36b1301bddb65e04d232d8ece510d405c1973a2232673f75e6021d39d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.11.0/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0b5f0fb0e26920b0fa09f06affe0a677e8f19e1c3c695ecd78be08480a53433d"
    end
  end

  def install
    bin.install "dotr"
  end

  test do
    system "#{bin}/dotr", "--help"
  end
end
