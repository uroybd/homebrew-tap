class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.33"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.33/meghnaad-hook-0.8.33-aarch64-apple-darwin.tar.gz"
      sha256 "fde34c366bc774154767474876301c92316d0fa2a7f993cf0f7d372f159da331"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.33/meghnaad-hook-0.8.33-x86_64-apple-darwin.tar.gz"
      sha256 "d4db804f3fa6bc62493621f87ed74396862f5d49fe60ce8f7001180f2d2645ea"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.33/meghnaad-hook-0.8.33-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "711228edd7d2db9ecda0084352d6f35de2cf8c6d12e432b9254937dc21491efc"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.33/meghnaad-hook-0.8.33-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e55683e555b1d929debc1d10e16c99a8ea769c44919bb64edf1555f5854c46bf"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.33/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
