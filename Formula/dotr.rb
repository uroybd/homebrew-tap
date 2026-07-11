class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "2.0.3"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v2.0.3/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "fe774d00b59072111eb7cd4d7c4e0750902e7e7d01fc7f53e72ffb5fd1aae7db"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v2.0.3/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "9d9bbcc15bba8fd541b4bf0f15d3219b3b6aa76d9dfad17777af48450f835827"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v2.0.3/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "caa9b47b355ed40103c8d58c21359f21ba485ad5a257e0e7aae4020559bc5258"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v2.0.3/dotr-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7ec32f4f31aae651da203ce54405516d47b96f4228e485cd4021f578a8309166"
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
