class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.44"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.44/meghnaad-hook-0.8.44-aarch64-apple-darwin.tar.gz"
      sha256 "757244bd3f1958a48aa43ce47d2527b8f9a719372ed0c4c5fcfb7e2578940353"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.44/meghnaad-hook-0.8.44-x86_64-apple-darwin.tar.gz"
      sha256 "59d04de580510739823018a261800724afa6710cf814c52c56f826e1a673a9ab"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.44/meghnaad-hook-0.8.44-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b76e067752e790d3738777ed44f58bfe7b5420584d113ec656faca6ed6e63228"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.44/meghnaad-hook-0.8.44-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a0578ac9d5c3447e5c846c917ec3cdbc231256f22454c0d624e676084472923a"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.44/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
