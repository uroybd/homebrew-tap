class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "1.0.5"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v1.0.5/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "79ad998272bc80030022bcf5f65b6d81dd70a1aa3383f764ba28782a9938aa2b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v1.0.5/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "3af78e3e0be305cb9dcefa6a695fe4cb639403416975f340cb9a305c89bea39a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v1.0.5/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "574643b69f214c7461d021c3de596ba6af921926d58b4633c966ff648f6a65e3"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v1.0.5/dotr-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1956fe10392c22b6891ed2f8e41caed597cfd5c728b4c3961c971cbba04039fe"
    end
  end

  def install
    bin.install "dotr"
  end

  test do
    system "#{bin}/dotr", "--help"
  end
end
