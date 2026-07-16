class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "2.1.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v2.1.0/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "92aabf7838b7fe7478e2be474d58da6e4410df6f60d3156a653a82afe9a602e8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v2.1.0/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "6221246a33b58b0a065747f5990087180f657809c305101eb0c3217a29e750aa"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v2.1.0/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "53aaa14f6245bd668bfec7469d9eaf4a7d3e754d1df01343d25657e4ed652efc"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v2.1.0/dotr-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5e6cc8faf54f2ba1e4d7668a86bc1e0456cb7ac32ff2b6152f06f1df79d203fa"
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
