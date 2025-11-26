class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "0.23.1"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v0.23.1/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "131be08ef1e1bbed9df636582afb7999cbd0c2ba9d99d6fd0024d70296ab497c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.23.1/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "34587695f08907f8361a02140d147b45499652ddd7462e07f9955a9e22ebe261"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.23.1/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "693884b006101d860941c167e97f009bdbfe6b12ccd99412f90cde6ded4f1c6d"
    end
  end

  def install
    bin.install "dotr"
  end

  test do
    system "#{bin}/dotr", "--help"
  end
end
