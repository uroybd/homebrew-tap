class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.10/meghnaad-hook-0.8.10-aarch64-apple-darwin.tar.gz"
      sha256 "ce0f72ccfab12eb3d6883c3d677bfa55ddde944b021553fc2446916e1f71f096"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.10/meghnaad-hook-0.8.10-x86_64-apple-darwin.tar.gz"
      sha256 "4064e2c123b4e78af30d074a75deba0312ea65c5404f8458853a9bcc512c84f6"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.10/meghnaad-hook-0.8.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2fa98d9ce4f8f9b1d0dca96373a53687a3d8f7da669fe77f017739fb32d2bea0"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.10/meghnaad-hook-0.8.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5bb3eaf5341efe61d472b989500c384017eba64dade878bd8b307fbdad16b4b5"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.10/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
