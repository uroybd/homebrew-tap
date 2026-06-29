class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "1.0.7"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v1.0.7/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "de285dcf98f021fe9390ea113d564870be6ea6f4f73d5ac7b26fbf836f2f4123"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v1.0.7/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "978ca9432d754f8824575147903ca0fd85e4a28ea5fd554ba7971f45b9807611"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v1.0.7/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8f93838edfc3e0cd9e2c8364bb2b06469563417feefc791a7dfeebd83216a237"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v1.0.7/dotr-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b0761167a24efcdbc25ea415bccc28f990997305fbce38da45cfca6db8a73b70"
    end
  end

  def install
    bin.install "dotr"
  end

  test do
    system "#{bin}/dotr", "--help"
  end
end
