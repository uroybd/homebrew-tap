class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.43"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.43/meghnaad-hook-0.8.43-aarch64-apple-darwin.tar.gz"
      sha256 "d97c932a8539e4724a4953e3ab3e41875ac88813ee3129314db2b5ac76310a34"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.43/meghnaad-hook-0.8.43-x86_64-apple-darwin.tar.gz"
      sha256 "cda5b7ecbf49aa110e162455c866b694b77f225abedda15f502a40ba87c35fe9"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.43/meghnaad-hook-0.8.43-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a802f1250159599aeeb32e9870b48d5bc89dba7d1a6ad11749f69d5a3a71af6f"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.43/meghnaad-hook-0.8.43-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b517f9bb5202c359aaf95725807ab6ee565ccb4ef8411d709ed5aaf00034d92c"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.43/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
