class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "1.3.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v1.3.0/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "090b3c65b45b5c69f7cd9cae7aa803918ccaab47c5a266af583d21476c1982d6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v1.3.0/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "45a59929973e0b1fd22d3b3b5fe37583de52b4dbbeed2c08a11b0c6f3d7e8d06"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v1.3.0/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "aa426b78aa826ea51c2e518c9431088dac84124f7707faa78176e70a4c6da44e"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v1.3.0/dotr-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "941a9ee399970c9a2cb07351b2a824f4a5a01772d809ceb0d8830c55121077e9"
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
