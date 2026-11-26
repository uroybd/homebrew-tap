class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.65"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.65/meghnaad-hook-0.8.65-aarch64-apple-darwin.tar.gz"
      sha256 "9f11ac4ba4f1f85e50ef375c1b6a93de136147751b254177f6da5a1b1cb16996"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.65/meghnaad-hook-0.8.65-x86_64-apple-darwin.tar.gz"
      sha256 "a77d57717cff94ad2b8c932719133dcf8866e7b3bb50f8651a8c80a50485badf"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.65/meghnaad-hook-0.8.65-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a9107c37bcfbfd378402e7e3f143362c2232834c73315e26783adf3e36fdf7c9"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.65/meghnaad-hook-0.8.65-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6d12b27d095af7b954cbd8e53ea6d53a26175ce245eaa54719116cff40c1cf48"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.65/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
