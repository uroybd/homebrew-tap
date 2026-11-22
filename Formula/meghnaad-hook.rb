class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.48"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.48/meghnaad-hook-0.8.48-aarch64-apple-darwin.tar.gz"
      sha256 "9798cafd87f77f04e31927c5e28c15c41a8d09ae9b4c4560982fc74e6cb97f37"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.48/meghnaad-hook-0.8.48-x86_64-apple-darwin.tar.gz"
      sha256 "ac120c783ce3ae63e03c53af7e826f199f19954c4a9397bdeb0e0871d39cf6bf"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.48/meghnaad-hook-0.8.48-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a40effa33ea490fd68cb658fce7b6b72deabc6d5796d1060100c77274cf983e6"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.48/meghnaad-hook-0.8.48-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "acc61c97432b12ae1366cd471284e88d2e3e355abb6604ed6610ff064cf0ec05"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.48/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
