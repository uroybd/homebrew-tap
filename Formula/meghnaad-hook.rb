class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.38"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.38/meghnaad-hook-0.8.38-aarch64-apple-darwin.tar.gz"
      sha256 "52e4c3df27e03e5e9ec1f40ae211a25ebe053f9aa35313ad346cfad1e2d90be2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.38/meghnaad-hook-0.8.38-x86_64-apple-darwin.tar.gz"
      sha256 "ba5b6eddc29b318fb1ec40f1154eb96be520256c84e0bd6bdf2b1e5bdb54b2b1"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.38/meghnaad-hook-0.8.38-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4cc68af462d02342197dc8f6567dc92faa1c0391edac67c892b811ea1f9ef96c"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.38/meghnaad-hook-0.8.38-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b04e7cf39ef403273ebaacacc29213be32a4aa217d15796ac13c29f9543145be"
    end
  end

  def install
    bin.install "meghnaad-hook"
  end

  def caveats
    <<~EOS
      Point task at your script, once (and again when it defines a hook it did not before):
        meghnaad-hook check ~/hooks.lua
        meghnaad-hook install ~/hooks.lua
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.38/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
