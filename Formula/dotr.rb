class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "0.26.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v0.26.0/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "3db780479a204f65b0939b5a39d68a5c81c373f3a751cdd94d7115f10b8f99e9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.26.0/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "b866a288c6fcb4a773e034262cbc1027ec4fa31ecc1945a46a0b6f6ad33617b1"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.26.0/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a1025dedf6cf47111b39299f597d71acafd44bff2d06bef405a2ae72ea3c08f7"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v0.26.0/dotr-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "df46e7dbbdd6a615d0b993e8fdcc9707060a674f2735a80032e5e2fac665604b"
    end
  end

  def install
    bin.install "dotr"
  end

  test do
    system "#{bin}/dotr", "--help"
  end
end
