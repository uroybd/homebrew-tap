class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.59"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.59/meghnaad-hook-0.6.59-aarch64-apple-darwin.tar.gz"
      sha256 "0f75548fc4ba4a6d3c41cdb702d2d71386e3ad79a3e6ce483ca727f182c3aca0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.59/meghnaad-hook-0.6.59-x86_64-apple-darwin.tar.gz"
      sha256 "c21aea1b47c463a90a1af1d891ddabeb72793a41d16d8bb68d4d40d7b86b33b7"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.59/meghnaad-hook-0.6.59-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a8b77b9e35f6814f32cb16041cf2874ca4393fa0a838bb4e636621f3fe472b49"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.59/meghnaad-hook-0.6.59-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1b859b1f348f81a9069e192c1fdee3ffe90e0582ce850e941e72412acd242265"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.59/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
