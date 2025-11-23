class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "0.18.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v0.18.0/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "b25868ab5e4ad6707a53a680e56f81fb515655d35db8e6dc2a83ddd4d96be87f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.18.0/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "df7b651685047133adba23bb22624e735a4315f5759cce74e03e7ce64da5b45b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.18.0/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e5328cfaf4d30f76dfbddfc2061efac2f90ef783099ca2a5a215b6d1e8d536df"
    end
  end

  def install
    bin.install "dotr"
  end

  test do
    system "#{bin}/dotr", "--help"
  end
end
