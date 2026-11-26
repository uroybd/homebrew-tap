class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.69"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.69/meghnaad-hook-0.8.69-aarch64-apple-darwin.tar.gz"
      sha256 "ab69c67d7175bd7535b9ca737be26362959a2092e75cb99714823dfdcc50cbb0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.69/meghnaad-hook-0.8.69-x86_64-apple-darwin.tar.gz"
      sha256 "3e55a2b6ec44570f5c2d4d7cd4a8f724c56dca918429c58e85fdb7fb4ed3f9f5"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.69/meghnaad-hook-0.8.69-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d7d8fee8e3336e653a266502caaf2428d9469348e2f7d54e053f0237e0712afc"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.69/meghnaad-hook-0.8.69-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c86bd40ca76f8633984fbb231b8d0ee7b987bb154ad2ed7ccb46c2bc27a6f9d3"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.69/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
