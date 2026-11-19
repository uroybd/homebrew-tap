class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.25"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.25/meghnaad-hook-0.8.25-aarch64-apple-darwin.tar.gz"
      sha256 "f91c24d283c40ec53feff46d4e2291779d17ce926ce57e285310bf3b081ae493"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.25/meghnaad-hook-0.8.25-x86_64-apple-darwin.tar.gz"
      sha256 "e67cfbfdefc0a0aea6561f28ed30f11d44b7951c671da31bb6abe7ad317c58d5"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.25/meghnaad-hook-0.8.25-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "112d465b3dbb602a026ef811ad8090e8a9bb66425082a7bce457202692b61416"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.25/meghnaad-hook-0.8.25-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a7f2394d499bfe9556b7fd5b238ed5bbd15177459e345ec2be022c6640797c0d"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.25/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
