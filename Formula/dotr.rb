class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "0.12.4"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v0.12.4/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "de72382ba1b57d12f697c9427f257b8938cacebd89262ffcee7aa62386183b40"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.12.4/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "e90acd3324ae43e77e37cae80f438b041c89f5bb6c7c66a9fc1e1d2a032ae1af"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.12.4/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a8ba832895d1e18723efd0bc8924429ec542ed5e80d8fd26d5c68a89e52baca9"
    end
  end

  def install
    bin.install "dotr"
  end

  test do
    system "#{bin}/dotr", "--help"
  end
end
