class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "1.7.1"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v1.7.1/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "a0162a937f554fed6d543921cae69bab87f02b584cff1f16ce5fc3718cc84391"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v1.7.1/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "f7a4064dc642b6306726d469cb7bdd0451a3e566a80a83a33bc998038272c434"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v1.7.1/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "af1c0c8d29bca3a883bd1355614199ebc15328c55188de19ec8d49fc392ca24e"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v1.7.1/dotr-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6612a5c400bb1d5014a09006380e3e304db5e18fe19350674e022a5ab676d052"
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
