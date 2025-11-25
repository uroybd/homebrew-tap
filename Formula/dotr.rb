class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "0.21.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v0.21.0/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "fb3a692baa30e00c97ceaf4c53bcd2b4168ec68339930e65dfee25af37c54af5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.21.0/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "733220462eaa17882d32629baa2f2f50e26028c14bed6b0ec9bde59cab234d25"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.21.0/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5671ed6ec58c1e904262b46af77246c41941ffe822629f3a43341e44a583adaf"
    end
  end

  def install
    bin.install "dotr"
  end

  test do
    system "#{bin}/dotr", "--help"
  end
end
