class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "1.2.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v1.2.0/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "153af2cb997aeb10504a94233487c664791c0e5cf5d965962f4f229a84bdd9cd"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v1.2.0/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "24db5baaeb80520be71607151dfba827dccb51a2fa853eec511d6daa4eea9050"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v1.2.0/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9df40ed6dc0a3ea54ff96b93cf051c85490e7bda916abb2ecbefa34fd4058877"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v1.2.0/dotr-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "01d882f43b682a1de93f4c40fd27ca595c0a4ee1aed9117cb32ca01019926c9f"
    end
  end

  def install
    bin.install "dotr"
  end

  test do
    system "#{bin}/dotr", "--help"
  end
end
