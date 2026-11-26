class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.67"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.67/meghnaad-hook-0.8.67-aarch64-apple-darwin.tar.gz"
      sha256 "777e79ace04ba8a37da3cf4baac9f535fd1db083b97106898dbc6c59d863116b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.67/meghnaad-hook-0.8.67-x86_64-apple-darwin.tar.gz"
      sha256 "8175e589028acadd53148903460e0a8224c5d03e975ee160909bae576162d89d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.67/meghnaad-hook-0.8.67-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7bc3edc2e1a865ab85dc86ef08bfc4e1b943724140267133474a1a5c295755a7"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.67/meghnaad-hook-0.8.67-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "30f95b1c6538e8124a6e9547ba370476127c6f2cfbb6acb6d5b1f22e462a240e"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.67/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
