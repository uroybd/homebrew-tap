class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.57"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.57/meghnaad-hook-0.6.57-aarch64-apple-darwin.tar.gz"
      sha256 "9768edb2f96746df0ae49d930c65560d9e62faa4aef2ebb33ac19869d9406ce3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.57/meghnaad-hook-0.6.57-x86_64-apple-darwin.tar.gz"
      sha256 "af48c6071cc124e73aa9da694fec63d5cf0f39dfd14250e9352b3434ac2d5e6c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.57/meghnaad-hook-0.6.57-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2693b5e7e13b66c5072bd8ce3aea86012c0a85fcfb1cf68b2520dd80ab04e07f"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.57/meghnaad-hook-0.6.57-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4d49e3490fb3b8d319036e2dedbd2725cd89c2f299cb213a177b1df9877c7e49"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.57/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
