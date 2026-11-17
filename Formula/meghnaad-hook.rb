class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.0/meghnaad-hook-0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "6b96948f5a962b25d934e849ffa314408382939e77538eea8569fc4b6c8049cf"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.0/meghnaad-hook-0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "ac994c1a39ddf798f6723c461f7b6e340be2eae49725ed592a76bd3d72907dda"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.0/meghnaad-hook-0.8.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "42b3fc4c9240b2d28711bb670db927d07ebef2b197205edead804ec0f88b0990"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.0/meghnaad-hook-0.8.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1d4937b4d077b2abe5a6983aedf547667058e77305dfb2b3e0f22865f1cdf9a0"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.0/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
