class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "0.25.2"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v0.25.2/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "77cbab2a6585528d99390f3b905d65f9b627a0e92a20fe67a7e707f172821906"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.25.2/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "d88a5399d4307ce66d9108ce9b5927e22344e07c5e84427d1f5e3ca4e0f16451"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.25.2/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "78ebee5177c5fa3002f1228502fc7ab62fa0b9a1963344dd774d6ed31db6c15a"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v0.25.2/dotr-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8b05a869e0b3e4d1106a7f482a558fc36691fb8932300d176d3b2ff2c72bbfe7"
    end
  end

  def install
    bin.install "dotr"
  end

  test do
    system "#{bin}/dotr", "--help"
  end
end
