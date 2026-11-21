class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.36"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.36/meghnaad-hook-0.8.36-aarch64-apple-darwin.tar.gz"
      sha256 "b8d10cb2b9021abe8c99debc4035255253ece247cadb7af3ee2d0d522e1762e9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.36/meghnaad-hook-0.8.36-x86_64-apple-darwin.tar.gz"
      sha256 "4ab1c87fa02696f3fe04101adf9f00d67e528afaee872c163973bd398fd42db5"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.36/meghnaad-hook-0.8.36-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e1104f7e1172e1b480a9646e7548be44046b6aef89754bd6e324902082b71cce"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.36/meghnaad-hook-0.8.36-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "340a21304ca8127bd63b8aeb96df06bda6d80ead3d867d23dd806395ff2de948"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.36/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
