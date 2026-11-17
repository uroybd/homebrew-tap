class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.1/meghnaad-hook-0.8.1-aarch64-apple-darwin.tar.gz"
      sha256 "c00846bd31c7ff9617f8c051ed1076fd14bd18629695f382563957bbd124b7c4"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.1/meghnaad-hook-0.8.1-x86_64-apple-darwin.tar.gz"
      sha256 "15a4e3a526edd9ef72959303419d9e21578cbfa1575f1798b7c2a48ec5800886"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.1/meghnaad-hook-0.8.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c5327e1ebd4585b60e72a125a2ac7659994b2a842d08c87e2200274c5bc227e1"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.1/meghnaad-hook-0.8.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b698a146f2eaadac400536c04a098020800327da7b0892911e665db99ac14b26"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.1/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
