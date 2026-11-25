class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.63"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.63/meghnaad-hook-0.8.63-aarch64-apple-darwin.tar.gz"
      sha256 "9f59f37fe83566e37ffc4b100d95609b0c0b19369fbe9566297fe1ada521c725"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.63/meghnaad-hook-0.8.63-x86_64-apple-darwin.tar.gz"
      sha256 "31c4962fcd431d3f80167bcca2fd9c86d93c88aaeb6fafa04a2774b6850d9351"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.63/meghnaad-hook-0.8.63-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "98020cd6610159d65c4aa496e93d066656a0048ce6e73c9e5f52d1d1ae0afcc3"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.63/meghnaad-hook-0.8.63-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9a89780528f96a7a799a99f4a4c3f3a3ac8b4bad16edd267a02ccd4edfcaa5cb"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.63/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
