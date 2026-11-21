class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.40"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.40/meghnaad-hook-0.8.40-aarch64-apple-darwin.tar.gz"
      sha256 "4fb54ed70254022f6421e796c1a78b0d5b5f0d23a30e1d3765618e137e248169"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.40/meghnaad-hook-0.8.40-x86_64-apple-darwin.tar.gz"
      sha256 "ac7d08bd480aaa6e28bc0c444c86be35b5d5b6be05930536bc259e7e8f45fe86"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.40/meghnaad-hook-0.8.40-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "92893b3bbdce6fbce698d86ecdfde66ae53eac0d11e59d933d898b1353443676"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.40/meghnaad-hook-0.8.40-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c1e6baee572b32f94aa1aaef70ce4806283ce57f73248ea4395a0b866fc39972"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.40/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
