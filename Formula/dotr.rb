class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "0.22.5"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v0.22.5/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "68c9f0c08da6d4df312a61f8538fa381d15f3ecbd8077762e5e766cebde61fb3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.22.5/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "1324cde8343c4e23c8c9909d959084d71d9cd24728971ab05230cf5c5c3dd980"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.22.5/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c344706b1b910e1585e60c0c18a174a45aa668c31f61d136beb07acadc245520"
    end
  end

  def install
    bin.install "dotr"
  end

  test do
    system "#{bin}/dotr", "--help"
  end
end
