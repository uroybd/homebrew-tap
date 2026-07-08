class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "1.5.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v1.5.0/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "221fc860808a108933d42483c61a3339f87c90fbdf679c1537135bdc9bc6f7ca"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v1.5.0/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "3af4ce3099a02b017c23128f179c54aeeb222ec438c9830f0dcc29143e0e8aa5"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v1.5.0/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5e52f66c3553989b990f6d7c4643c84528ba5d76fd84728d949486efe008e154"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v1.5.0/dotr-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c3fb9bb78771dbaa68fad663c9c47fea58304cf763873125a1b825b9dbf3a965"
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
