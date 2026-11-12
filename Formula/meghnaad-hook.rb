class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.53"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.53/meghnaad-hook-0.6.53-aarch64-apple-darwin.tar.gz"
      sha256 "0174f0493ee1a2f5094af65f19d0adccc8df9288982f6bba44704533054e7ff1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.53/meghnaad-hook-0.6.53-x86_64-apple-darwin.tar.gz"
      sha256 "81852892397911ade03010a90457608f9b454b50492dae5ed296f2fec076148f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.53/meghnaad-hook-0.6.53-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "abc84d6efb9bf2ec8247b77336e3db6e0d5a7f13a62c6932321b4131cbf92c74"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.53/meghnaad-hook-0.6.53-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9bc26ddb8c7e8f3d9af1668a213d69b94d35e779076e037fd1993317f5718fc3"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.53/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
