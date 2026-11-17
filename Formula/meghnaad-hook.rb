class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.82"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.82/meghnaad-hook-0.6.82-aarch64-apple-darwin.tar.gz"
      sha256 "7865878e1a7b7f743bba2136f38eb9cbcaded489d58da97bbab8db967a08aa83"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.82/meghnaad-hook-0.6.82-x86_64-apple-darwin.tar.gz"
      sha256 "cbf21da2917e55bc8f98620df5931f25d108f528f6dc497f343fd82d8e75597c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.82/meghnaad-hook-0.6.82-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0acdfdd58d1322d0de81d1bf888c6fdb8d7fd13ec0403fda3ff29b35326574d2"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.82/meghnaad-hook-0.6.82-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b57a2931e00ce582cc56ed464dc34f0bf311f713238a38e8ec6d64e135bcd0ed"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.82/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
