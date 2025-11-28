class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "0.25.1"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v0.25.1/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "e7add718224003cfbbb070ecd790d2af92c8857c64d93116e86adb6df5439f0f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.25.1/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "273416aa8578818c2b093a2b6405efd652389592a414ea6c9995c408b915fe78"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.25.1/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fb8f09fc949c75eac4a98a98d4562163c51c6779dfec3697dea3e51c5dbe492e"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v0.25.1/dotr-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cf790ef95c05c028b741bf53f6f8dec2a686798a1bb2259acf7f3f3e2f0eb8ae"
    end
  end

  def install
    bin.install "dotr"
  end

  test do
    system "#{bin}/dotr", "--help"
  end
end
