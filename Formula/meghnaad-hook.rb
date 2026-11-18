class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.5/meghnaad-hook-0.8.5-aarch64-apple-darwin.tar.gz"
      sha256 "a3e7ae7a822bbecf9de26b6e8f83ef6aa8ae27e5b4019eb0276ed24344ee6c67"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.5/meghnaad-hook-0.8.5-x86_64-apple-darwin.tar.gz"
      sha256 "ab6bc491aa0f8143ea7504134a0c95eba29490f2bc6f8dfa32c42dede0ef08fe"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.5/meghnaad-hook-0.8.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "65cdde0bea50880b2b5f0cadecbd0a749360cf2af827ccfab835491520609328"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.5/meghnaad-hook-0.8.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "818bc19cc1a01de64992596acf55fb8aa46c2e7ebed2cad53eb50bad88a2bf6e"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.5/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
