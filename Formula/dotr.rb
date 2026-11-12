class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "2.4.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v2.4.0/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "b4c3d87e7c9d4ec0a8c7362ceda5048a348b1c989f53217279b7a544524aa648"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v2.4.0/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "5cdde1ad965258d6482dffc18939e64855b7047b0cc843644fcd96d22cdc8d91"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v2.4.0/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5f0c699505164c8e5895d50bde57c82c3db71e72068b83403735ee2bb6d6d7b2"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v2.4.0/dotr-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "52250994dec8c215414b4c208c3c7e82d5fe671b4016acc999b29186f70228b4"
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
