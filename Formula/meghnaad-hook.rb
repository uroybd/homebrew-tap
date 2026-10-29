class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.40"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.40/meghnaad-hook-0.6.40-aarch64-apple-darwin.tar.gz"
      sha256 "e98ee68daba6d50a17dea327cdd593e6031ca2b0a57e847e43477e0e98af1fdb"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.40/meghnaad-hook-0.6.40-x86_64-apple-darwin.tar.gz"
      sha256 "82ecbd3933eef1733688d81525a1bf8169a87e14c215d855cbf6a9e035c4368a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.40/meghnaad-hook-0.6.40-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "27eb4960a09ae47a5b00c5ac06279ccf4f41b1ac1b66a868098e8cd424b0d882"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.40/meghnaad-hook-0.6.40-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2b7d40c6032ee294d06949bea2fbfdfbbd15670e6abfc1b7d26f72740b0e6cec"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.40/docs/using.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
