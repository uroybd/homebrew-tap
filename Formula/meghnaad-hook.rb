class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.68"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.68/meghnaad-hook-0.6.68-aarch64-apple-darwin.tar.gz"
      sha256 "cc793c8de822ec6cc7792b97a438771e617fa277a60d20eb00a5431ec9780506"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.68/meghnaad-hook-0.6.68-x86_64-apple-darwin.tar.gz"
      sha256 "1f3ba1261609a05bd1dff9b4ed18fecc99d29639a87d65fb0bc436cb8662dc1e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.68/meghnaad-hook-0.6.68-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "190eabaf82ef513346f9586a4cbf1a315d3ca7df0b75f8be9cee61a6da23f9a2"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.68/meghnaad-hook-0.6.68-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7997616b011c3e28549b3c6dc5e083f7a5e5c4a73a5c93653883f54f97a8ee91"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.68/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
