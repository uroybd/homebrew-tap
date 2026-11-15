class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.67"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.67/meghnaad-hook-0.6.67-aarch64-apple-darwin.tar.gz"
      sha256 "2b84d60fa498d01c6745d1151d454a329ca223eceb991b0af94d5814d0cbef0b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.67/meghnaad-hook-0.6.67-x86_64-apple-darwin.tar.gz"
      sha256 "c0252a37c3da1c2cdf5d11115ca57c0668eeeb8cb7c945d9cbffe1211f023c2f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.67/meghnaad-hook-0.6.67-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ca4a1f2415271ee064d8b7030505e9402ce062e59ccb835e21b0011c513238c6"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.67/meghnaad-hook-0.6.67-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "98ee86320a11c61a8228bab57a166b142fbf1a1fd86d53c5bd44afd1cf4d4b2b"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.67/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
