class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.77"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.77/meghnaad-hook-0.6.77-aarch64-apple-darwin.tar.gz"
      sha256 "3eb1216773122c8d8d5fd5d3a3c7000676cc8b05276f3193d419eadeeab03e52"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.77/meghnaad-hook-0.6.77-x86_64-apple-darwin.tar.gz"
      sha256 "e2d38aedd5bc0faace765a2f56d95896b84a965993caf0ede0cfa9db5405f5f2"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.77/meghnaad-hook-0.6.77-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ce5a0ffdc6e08032a6d08f1815da1e5115b10bf8377b6e1fc854f46c9c0bafee"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.77/meghnaad-hook-0.6.77-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "443868b63221929b5477f9586614880bfa45d82738d6d8972a736928236853d5"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.77/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
