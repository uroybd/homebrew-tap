class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.73"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.73/meghnaad-hook-0.8.73-aarch64-apple-darwin.tar.gz"
      sha256 "1616b5064aaa21a42a4688a1413f695ca7d3bfe8a415296ea074a1598a8fc41c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.73/meghnaad-hook-0.8.73-x86_64-apple-darwin.tar.gz"
      sha256 "432d2a5bae4eab2f8e56b2ede50d335b0bd29b534d5bed9cb715d6fb95a1d29d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.73/meghnaad-hook-0.8.73-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "47b910ce94df1039cbf1bfdf010c68ec3698ea8ccb42ca20c6d3772e7280397a"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.73/meghnaad-hook-0.8.73-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c589a9bea2049ef5c5c9ace1cfcb5d3cee2427704543b5ed8c84f14b02ab71e6"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.73/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
