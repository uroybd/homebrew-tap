class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.28"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.28/meghnaad-hook-0.8.28-aarch64-apple-darwin.tar.gz"
      sha256 "7f8167c616e815a5e6e9af4f61228b53e1a54a919d703967b33fbb502cbc5cc0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.28/meghnaad-hook-0.8.28-x86_64-apple-darwin.tar.gz"
      sha256 "e256ced6892799377bfcc8dfd8f7eaa48a0e99f81dec094b5a72673b7750762b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.28/meghnaad-hook-0.8.28-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b2afba28fc1a2caa2abeb2f3e92d9a28c8cd9d995b5acc9e2d3915d9960abc9b"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.28/meghnaad-hook-0.8.28-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "935d92f662650dee3a617304de7858bed3915644af44df53597a48675e131690"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.28/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
