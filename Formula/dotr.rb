class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "0.19.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v0.19.0/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "e6cb3bb2d8c49df79c4dc57153a7272bd1f1fba358cb7cb9a18094d41b1b7180"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.19.0/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "f3c9eaad37c8179b84cf61a2eb5227f48d2bca53074e47ceab1ca07581aa019c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.19.0/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "56faf38f3dc5cffad7ac7e8c90bc9e5d1d54a67b11d497bad39ebd5a924ca07e"
    end
  end

  def install
    bin.install "dotr"
  end

  test do
    system "#{bin}/dotr", "--help"
  end
end
