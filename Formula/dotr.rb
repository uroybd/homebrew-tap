class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "0.12.6"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v0.12.6/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "d3071f9a88ca3ea8e1909dbda74f1ab67242806bd4b71b9d55482d16dfc8bc66"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.12.6/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "0760e43f54861d37a50ab9a2b2445e4bcbff4546f81664fec6a6a373a1ad62ac"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.12.6/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "59f5c35261465e1de664426c390fab33d9ddeb6745b4935407030f31ac523b02"
    end
  end

  def install
    bin.install "dotr"
  end

  test do
    system "#{bin}/dotr", "--help"
  end
end
