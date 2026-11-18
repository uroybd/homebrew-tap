class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.8/meghnaad-hook-0.8.8-aarch64-apple-darwin.tar.gz"
      sha256 "682d4b2e59bdda8d8e9a1814f44292a5728629471f28611e2324e546cdbc4571"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.8/meghnaad-hook-0.8.8-x86_64-apple-darwin.tar.gz"
      sha256 "bc1d99e3b971c0f4faffeca2b6b6e9f7bc74eaa659723594002e4137cfc04923"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.8/meghnaad-hook-0.8.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b870d5626121d043cc6b389a9b41b9427711e4cca33a66f707aac05ce5767ea9"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.8/meghnaad-hook-0.8.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4d18ce0751dc460dc33d1465fc4875a1da41f7dc5c44a5fd528a604d4cb8e95e"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.8/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
