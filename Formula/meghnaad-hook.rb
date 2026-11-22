class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.49"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.49/meghnaad-hook-0.8.49-aarch64-apple-darwin.tar.gz"
      sha256 "79d698a46e0108b52f08a37cf3f99aa3928af3c62eb3e8cdae25dd415a0e0b0b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.49/meghnaad-hook-0.8.49-x86_64-apple-darwin.tar.gz"
      sha256 "4bc16d3553fd49c734c195b0bf9e12fac0c64b62b51f384e3b685284d6fd8ebe"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.49/meghnaad-hook-0.8.49-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "63e0748d4413c656237a96a8e9cbd48a140be7b550e26918f0853841fb8a47cf"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.49/meghnaad-hook-0.8.49-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bb4bf72ed5ce2fc86a8fc06ca958a03d8a694517238e43285a5a801f932e0304"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.49/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
