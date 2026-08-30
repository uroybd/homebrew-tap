class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "2.3.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v2.3.0/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "7c531af8d3636047e8fee79904c1701461d1b8e222e842a59c64919b5515659a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v2.3.0/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "cbe5d2d30a56987d760ec766027c3f34142d8d99e0f9dbe4d97c48ee404005e0"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v2.3.0/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2200ca968a7e169949644ca5df149d9bbfe69c1744757c2c9f241ae533c7eaac"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v2.3.0/dotr-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d104f300cb16892c97cbccf90e79be4b2068fa3c89812658af4c2f631bcc8f79"
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
