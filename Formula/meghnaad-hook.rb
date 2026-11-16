class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.78"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.78/meghnaad-hook-0.6.78-aarch64-apple-darwin.tar.gz"
      sha256 "08e61799679e00a745747d9bb0df251652c32b5dbf164f9ffc8cf0493180f1f6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.78/meghnaad-hook-0.6.78-x86_64-apple-darwin.tar.gz"
      sha256 "a31d3024be43c5c0256c8f3809203c83f475053ebd2924b3fc2c0ad912635da2"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.78/meghnaad-hook-0.6.78-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1d4b8f40c628d45e46dc1185e6d927e8c7ca228b3b2621a60b3a66782207ba8b"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.78/meghnaad-hook-0.6.78-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "85ea8bc2c5b99c8bd502094c68463ebb1b48ad0fed391fe0aba49282fad166d8"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.78/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
