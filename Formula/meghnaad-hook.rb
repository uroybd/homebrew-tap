class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.62"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.62/meghnaad-hook-0.8.62-aarch64-apple-darwin.tar.gz"
      sha256 "509beabdc92695d495f43e1f4b0bd7feb45457e4a0c0adb30cee6d85bc20d6d7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.62/meghnaad-hook-0.8.62-x86_64-apple-darwin.tar.gz"
      sha256 "a5dc9a402d3b66bda7de1abc0b09ee798ae06270138a084496e31fe9521cf15f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.62/meghnaad-hook-0.8.62-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ed91685e451013df251e2c75163213be46dd41aff06baeb47cf01ea0ab745028"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.62/meghnaad-hook-0.8.62-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6fbbde2317c2f789a3c2414e1018ab90a9494f424c1c4f4dcd52ba1973fce19a"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.62/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
