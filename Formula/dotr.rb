class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "2.0.2"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v2.0.2/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "4d9bbf675c76c4173b803f279ff0c992440c9054075a113914f9acbb28d9bef3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v2.0.2/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "7214fa9a9268f2fc982a567af07be238749f2ba3364dec5af51c461e2f5c92c6"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v2.0.2/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ca5b39722efd644d2299f4762345c98bc0665c4f0e70e8ca5cc504d1dbebbfc3"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v2.0.2/dotr-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5cb656029ed4f1178407d0553df7a59d9c3b46d0cfdade3059642a4e019c3842"
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
