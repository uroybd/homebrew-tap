class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.73"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.73/meghnaad-hook-0.6.73-aarch64-apple-darwin.tar.gz"
      sha256 "7a978f45ba790403787a5c0f1b3dd2cd817f779bfaa65788df29a98227cd7c4b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.73/meghnaad-hook-0.6.73-x86_64-apple-darwin.tar.gz"
      sha256 "8ff832174803cedc13a02935a9036034e76e7ed22c3fd93b03aa1e58a2dda51a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.73/meghnaad-hook-0.6.73-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "557b0e914b3a5c7b00da843e7af54e59c0a032d1fcf26f6f5869c63cb4f2a5f5"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.73/meghnaad-hook-0.6.73-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ab3f5be0d577adb75ee6f24c52873f993e6c688d69556659440ac202b5a2bc59"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.73/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
