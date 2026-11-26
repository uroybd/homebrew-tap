class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.66"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.66/meghnaad-hook-0.8.66-aarch64-apple-darwin.tar.gz"
      sha256 "db7d32e9ab42684eac58c90c37da8d8657fa2eac759fa7c43f071021444f3fb3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.66/meghnaad-hook-0.8.66-x86_64-apple-darwin.tar.gz"
      sha256 "5eae91e13356ce685fdf0a679adbcb2c1d33732f6dc2446f5146d2cdf400487c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.66/meghnaad-hook-0.8.66-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fc59c349f47b13451cba69b53eb218152b3e20c280b4df8921a4a982811077e7"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.66/meghnaad-hook-0.8.66-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7b0634bc26155b79ae4aa77a71e8b793bd09e78625a6e9784d15749333d98c7b"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.66/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
