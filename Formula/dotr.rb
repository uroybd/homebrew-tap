class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "0.22.2"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v0.22.2/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "f8d07fb72d0c775535a14057b304be90d2728525d2ac584096a89251f71bdaec"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.22.2/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "64b59b9ef6d87bf4d7857697941a63a27748618993b865f783a384e34edf619e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.22.2/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d3ba62ef394bc716a428439aa7bf71f8e1a38eab23b4c45764ee380e9f727f49"
    end
  end

  def install
    bin.install "dotr"
  end

  test do
    system "#{bin}/dotr", "--help"
  end
end
