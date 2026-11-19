class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.14/meghnaad-hook-0.8.14-aarch64-apple-darwin.tar.gz"
      sha256 "08f4c4fd3d82f2b9ff2a6ea3bc9c481c691404eb83f7868460b458cf2e75622d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.14/meghnaad-hook-0.8.14-x86_64-apple-darwin.tar.gz"
      sha256 "3431a2ae25ff08a59d8d2d02b12c0d14f367ac3eb2b3dfae948a6069ca5683a4"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.14/meghnaad-hook-0.8.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "600e2bb71c8abe31e910b28a8fc1531f64956a7dfdc74ea23c2d3ce8e1de0dbd"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.14/meghnaad-hook-0.8.14-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "20aa9eba74a1201079165bab2c50dd948efc32ba6cc31b305a10df2421fe62b6"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.14/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
