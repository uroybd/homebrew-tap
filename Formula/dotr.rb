class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "0.16.3"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v0.16.3/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "efbc453dbb04ab123b57d8ebaa739f41b9b24ee8dc4f84330904d8a9fd090a6d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.16.3/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "dfd930351ba746d90ffe8d9c66084f589767b1d63cdc2f3c98b6e683ea1c9da6"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.16.3/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "169bfa1a3d17dd05d4119880bf3cdfd815a9a6d7bb657926da32a74a3ff238f6"
    end
  end

  def install
    bin.install "dotr"
  end

  test do
    system "#{bin}/dotr", "--help"
  end
end
