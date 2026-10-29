class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.39"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.39/meghnaad-hook-0.6.39-aarch64-apple-darwin.tar.gz"
      sha256 "81896457c55bacd4ab3792a97db042c176ed6b1ce98e7fc0a0556b5da47d2901"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.39/meghnaad-hook-0.6.39-x86_64-apple-darwin.tar.gz"
      sha256 "4b74741806105da66fa7cbdba369ef229f319080e813ea8ac9a03df6c82aba57"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.39/meghnaad-hook-0.6.39-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5ef9b27ed9cc179f0e56829cb70fb6daf8d682c2f1ee1601526395c3fc0203ac"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.39/meghnaad-hook-0.6.39-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "058d26a4063c9962936d31b7267c4fbe80da2c425eb0fc5c11f35b0dacd36d54"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.39/docs/using.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
