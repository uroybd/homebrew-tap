class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "0.17.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v0.17.0/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "5eca596035a61fa09a1488e2e5864d1d9a648fe5f56247239f82ff286364cedc"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.17.0/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "fa5d49e3b408199760c8b4dea56ef18ef4144dceb1da6e20dcb464ef969946f4"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.17.0/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c17c4594a1da809a0f5e7cd31211069be50472c520bbbb32f3846d432029e673"
    end
  end

  def install
    bin.install "dotr"
  end

  test do
    system "#{bin}/dotr", "--help"
  end
end
