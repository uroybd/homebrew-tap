class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.80"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.80/meghnaad-hook-0.6.80-aarch64-apple-darwin.tar.gz"
      sha256 "f2920d04631933769a239a50a9940d26590d76715f442f0c754b74c0b2142c83"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.80/meghnaad-hook-0.6.80-x86_64-apple-darwin.tar.gz"
      sha256 "6869e1377818eb7923751702d0b4c58e609c285c2c73058a3c00357848e44b74"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.80/meghnaad-hook-0.6.80-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bc50cace0186bb9915e5df914767f5df1c4693c6a2e9158d745a2ade003449fe"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.80/meghnaad-hook-0.6.80-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cf471abad6f1313c349ab9f3df376271094e726e9440feb88c96f84d9f06cba9"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.80/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
