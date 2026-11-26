class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "2.5.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v2.5.0/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "5b322711837887ed2496a454dc618f326ff76be3f6987e9ee62dfa811a972b7a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v2.5.0/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "f6ae12a38522d378e4bda034864633aa4c52b8b6d2dbdd1032b9726412112114"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v2.5.0/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "79d32edffaee1eb2ff057ee479523c5384a563fad2cd3413a863bd59c9b13291"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v2.5.0/dotr-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "55f35742785f22153d0b76fc990dda1f787a60dbda45df06f16015a8eff267cc"
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
