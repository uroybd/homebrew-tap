class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "1.8.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v1.8.0/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "98a2f49cf040b06a2f379f719fbdce740e2a653f2eeb9edf4e2d721e57729636"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v1.8.0/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "4d644cd126e5d712fadc4056c3523855955c707a041b6bcb3aa6c6ddec554415"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v1.8.0/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "45eb114c896cb79d39adc4c5feb06381faeda736093aed9970040c117c75e44b"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v1.8.0/dotr-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5d711b5c9e3f16e3b7eaf88dcc9bd574db0c8be7ce02aee46c883e5a9c908dee"
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
