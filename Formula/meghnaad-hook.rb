class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.19"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.19/meghnaad-hook-0.8.19-aarch64-apple-darwin.tar.gz"
      sha256 "b77a211e15095103b2f711c2ec213280da93db327be18817df7cdbe1890edecb"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.19/meghnaad-hook-0.8.19-x86_64-apple-darwin.tar.gz"
      sha256 "835b5bcc87f5b09bbb0201d4eb4ce555bd10e9febbf612553d31e2b50b9a80dc"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.19/meghnaad-hook-0.8.19-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1a4a7d85a46f4a43534fab3392b83bce18918de74ad9327bd170d2191fbdf403"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.19/meghnaad-hook-0.8.19-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e8e1af23a0aa20b6eba12e9b8fea7147c944e564092875377a71674ed05b540e"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.19/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
