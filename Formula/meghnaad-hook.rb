class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.16/meghnaad-hook-0.8.16-aarch64-apple-darwin.tar.gz"
      sha256 "466bbf45e7a3073702ab103d6a6e6ecac11ef33f1b22640f17b97b2e10d53a43"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.16/meghnaad-hook-0.8.16-x86_64-apple-darwin.tar.gz"
      sha256 "f87344422c25f8336a52d24b549670e5fb4aad7e99052867d82ae90a2aad8700"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.16/meghnaad-hook-0.8.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5ff286a02a7c1f3d9bf936e452d811431b1cabd020ded8224113a92b6caf6513"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.16/meghnaad-hook-0.8.16-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "12d8e8a6fae63c871f9b68a772993f858a334dc9217d46045e8543a37b46bbaf"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.16/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
