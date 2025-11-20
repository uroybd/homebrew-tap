class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "0.7.2"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v0.7.2/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "b03e3b4e00c34dc61b2f7b24851e52b695ef18d63e39cdd66cd3027e7373326a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.7.2/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "25330b195a5b694d1758cbc1af47e07405f330cc399a9249a75fc23133fcd69f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.7.2/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "74db23f9b3f394e39563807df9029f8bacbecbc80201b49918d5a296e9f53b06"
    end
  end

  def install
    bin.install "dotr"
  end

  test do
    system "#{bin}/dotr", "--help"
  end
end
