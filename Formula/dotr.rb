class Dotr < Formula
  desc "A dotfiles manager that is as dear as a daughter"
  homepage "https://github.com/uroybd/DotR"
  version "1.0.6"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v1.0.6/dotr-aarch64-apple-darwin.tar.gz"
      sha256 "d850b131979df559fe9629571819cf3ff76c90a2d7f4e34dc3ab725350dfff13"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v1.0.6/dotr-x86_64-apple-darwin.tar.gz"
      sha256 "f32b24b834e190e4c18e1283bb88094fefc476e0e96167c3e8fedc6f9dea5f87"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/DotR/releases/download/v1.0.6/dotr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "998c94673a05edd3ada2958332c3305142cb152cf245a5a3ede13d39ad138c9d"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/DotR/releases/download/v1.0.6/dotr-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2bee8f57636d64a345f36498f54cc1153abbd5270560d59ea3adab4fe852ef88"
    end
  end

  def install
    bin.install "dotr"
  end

  test do
    system "#{bin}/dotr", "--help"
  end
end
