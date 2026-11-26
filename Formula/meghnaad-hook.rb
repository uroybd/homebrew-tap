class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.64"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.64/meghnaad-hook-0.8.64-aarch64-apple-darwin.tar.gz"
      sha256 "b599594fa539b985bbe73052f489c3c3d654f9f859df9b85e88ef5a66b7b44e5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.64/meghnaad-hook-0.8.64-x86_64-apple-darwin.tar.gz"
      sha256 "3fe82aae9d2fb1b34ddd47beb42d719b788094dacee855094c67746a343dd37f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.64/meghnaad-hook-0.8.64-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "01678f74340f0caa592396775b10a8e9acf3b1921abbc7bae96f6096405b8fc5"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.64/meghnaad-hook-0.8.64-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c8befd1ab3a7e113c0f2f542f760aadc91453ff3c2128e43dba343329d2341bb"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.64/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
