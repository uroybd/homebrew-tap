class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "1.11.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v1.11.0/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "e4e5ce7e8cfd3bc2ddf2fa5dfafd34d40d79c0dcaca03ce2f705ed1bec57c57c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v1.11.0/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "c56e9c861b172ecc97ce1566ffd3bbe11eeb17a77803b0891ca08854f8ed08e7"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v1.11.0/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3e73df0d77c8306e81497fb6c1ac02c760c0806168a28f08ccd7b04df7977757"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v1.11.0/dotr-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4ff1da38439f48905d656afabda3a68dd7ade83abd4f9fb2eef31b70ad0e16d9"
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
