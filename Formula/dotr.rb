class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "1.10.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v1.10.0/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "cd1ea07a6ec15f5eb08008a3c8e3a5a1f9395c2a25b6ee8501148548613fdd4f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v1.10.0/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "e030cc7404fb7e8eb7f27953c5bf02d0cb511fd1ae41ea2ad0158d6ec38dc1bb"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v1.10.0/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c3cb132d62441c89e428b20c1bf8010cd8ba1bad8420658514c0d505289b1789"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v1.10.0/dotr-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "aefdfb62c0a8e72fec068a319c5c13286bb00123a73b9fba91da8da951c768fe"
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
