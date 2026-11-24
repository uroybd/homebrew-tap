class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.55"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.55/meghnaad-hook-0.8.55-aarch64-apple-darwin.tar.gz"
      sha256 "5cf872fef5a69ed1183abe1defcb32a243b434245378e57536cc68fc65c0c150"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.55/meghnaad-hook-0.8.55-x86_64-apple-darwin.tar.gz"
      sha256 "3d2e5173ad3666aef7b093de7484aadf63f65ba1d00bb4102cba9864743b4b7b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.55/meghnaad-hook-0.8.55-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9157cdf1b0c6dad99b026496db91aa4c623017a6f638c5fde02669a698c71652"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.55/meghnaad-hook-0.8.55-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7c033ed545b287d6c3cc70cbbacba13e705fc1d1a3594fe1e3ddd12ab0cd292b"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.55/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
