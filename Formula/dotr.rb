class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "1.3.1"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v1.3.1/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "8255f910f86a7c36126bc9a88b10f0612b5b300bde78bc370fe875e91b6db952"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v1.3.1/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "7a85ef67504d0ef3d8888f764557458dbe0d0b4f0fbc7e0f5485ab3d494c8d20"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v1.3.1/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f4f9ac9e6d8b587d28ade4658fbe2cd024c91f86d6f3fa9bf435ff05bde57441"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v1.3.1/dotr-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dad1dd81d6ecaf7356ecb87787ada827ba43801a1767cd3aecd9990196973d75"
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
