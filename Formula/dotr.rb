class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "0.18.3"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v0.18.3/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "ef95722417877e6cf8ec78c00bc694dc6152e8a1c2b94cc1bf6db96654e1643b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.18.3/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "22e81484b02c08f1b5375837ada72c12c584be3de72cf2f09d3791a3b61a5574"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.18.3/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8739f381519f6bbf644da2769cc8755e8798887d4902eda4ea0db17c4671d57d"
    end
  end

  def install
    bin.install "dotr"
  end

  test do
    system "#{bin}/dotr", "--help"
  end
end
