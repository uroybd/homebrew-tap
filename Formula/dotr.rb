class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "0.12.3"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v0.12.3/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "b00a2f0ff3a6db06686572c9f9c97e5a18f5b9de8820884667756faee727e72e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.12.3/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "10dc903985a045815dcd79dfbac22ef817c63d750b61db6a9fa4e48f5d2e6660"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.12.3/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "040b0690cab8bae1b6bb8facf0b1b3cabb2d1c4be80d04e180922cb7966f1ff5"
    end
  end

  def install
    bin.install "dotr"
  end

  test do
    system "#{bin}/dotr", "--help"
  end
end
