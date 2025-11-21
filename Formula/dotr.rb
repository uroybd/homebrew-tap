class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "0.12.2"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v0.12.2/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "adfb177ea4a671997e9545b1e8f5c1721cc08a86804bce703e68e7bfb28507f8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.12.2/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "23d6e3435eb6147c7ffd67212feeba2e660c466f887a9b27c907b05160562b5e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.12.2/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "971346f08d11c80016bcd4e4670139a584f2b19a97cdb6ec774300a77f6ebb3d"
    end
  end

  def install
    bin.install "dotr"
  end

  test do
    system "#{bin}/dotr", "--help"
  end
end
