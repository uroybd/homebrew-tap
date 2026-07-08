class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "1.6.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v1.6.0/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "2876198d008d4322833fbb2db3b6a0ba5ac1c69b7ba34e9bfc049a87f56b8f47"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v1.6.0/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "b9822d81df260598ff52ee62623c95214bc7afe3c771353565e71dc0d90067fe"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v1.6.0/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "95aa472f43b06b0723bf8277fe93f41a54c7c3ffa1ba65eccc31681681377c1e"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v1.6.0/dotr-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0f1b463e16db3d79599b47aa44d5201aea9e36cce47b6fc7cb8a4b9c688434dd"
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
