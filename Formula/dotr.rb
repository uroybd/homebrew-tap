class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "0.23.4"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v0.23.4/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "d2edab282d1a051e093c457203ecd1678fdf50ea4c5f0964851064d94ef290cf"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.23.4/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "6b1365463a2933d2b58d01dee5e2fe23b699541df14e9980cd41ec75eb4171be"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v0.23.4/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "08571bcc1da1337fd18fe2278ab460368ed906ae0fad40c730ae88201b4de4bb"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v0.23.4/dotr-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c07badeea16527ccdb97ef01d80977330f55f4480dc19a46ac8272b23d2d6478"
    end
  end

  def install
    bin.install "dotr"
  end

  test do
    system "#{bin}/dotr", "--help"
  end
end
