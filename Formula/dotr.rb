class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "2.5.1"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v2.5.1/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "2012259c7e5abc25594223c80e876c92559dc39da279ce00342a012c4308eb4c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v2.5.1/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "6db2b0740412acc1a4cb05a661fb012a1bc0f27c4c37f02cb6a7a20856878b96"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v2.5.1/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "76b57f93f92ede837f58fa0bc3bcf56d6315955c663ea27bd9f2da43410fd10f"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v2.5.1/dotr-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "75be22d5226bf22329c6de09b353b9b0df64ba6a13b801339b03306e4e5d80e0"
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
