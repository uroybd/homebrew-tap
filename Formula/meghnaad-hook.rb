class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.54"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.54/meghnaad-hook-0.8.54-aarch64-apple-darwin.tar.gz"
      sha256 "721d66ff7ca35131389bd166b95296e22cee859d3b05eb601eda96129220dc30"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.54/meghnaad-hook-0.8.54-x86_64-apple-darwin.tar.gz"
      sha256 "7875a77621eafae8db972712a8e5e88afcefc39cb28f5c61a9aa0a0dda6245d4"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.54/meghnaad-hook-0.8.54-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "584e44b36a39348f04be9d248b5f729ee390c314caa0a16b8c6802fdaf9f5c8f"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.54/meghnaad-hook-0.8.54-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7f8ca77bc85ec5c07206b700d70979025d33fedc13588aac951ebc4a55aeb5c8"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.54/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
