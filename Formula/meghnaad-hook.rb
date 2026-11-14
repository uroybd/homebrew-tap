class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.63"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.63/meghnaad-hook-0.6.63-aarch64-apple-darwin.tar.gz"
      sha256 "31001bcd611ff519bf8fc456cc2fa985857fde698f5e889f460da225ea7954ee"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.63/meghnaad-hook-0.6.63-x86_64-apple-darwin.tar.gz"
      sha256 "72b374b18c6597613994f8cb48be682774062d79074cb8f72816253eb2970485"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.63/meghnaad-hook-0.6.63-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cd62311143876d7b880c2c34f633f520a93ea6e2587c23d67cc23f7355949990"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.63/meghnaad-hook-0.6.63-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9c725b6a4f60873e15bc57c690085903cdb9ca1d0166a391e3805e4c9a9f632b"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.63/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
