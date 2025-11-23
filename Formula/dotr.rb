class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "0.18.2"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v0.18.2/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "6812f5d274f7ff9b879388c982b85e496fadc09b05a116034219ffe5eed2cd18"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.18.2/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "92147671d935ad184e812f671855d6ea3c6bb69c04748a4af7c6561459a4460c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.18.2/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1b3bb2b59096ddf5af4dc85d3c0d066e2e777d323d7848baf91570748cdaf8a2"
    end
  end

  def install
    bin.install "dotr"
  end

  test do
    system "#{bin}/dotr", "--help"
  end
end
