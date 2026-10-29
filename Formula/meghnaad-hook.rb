class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.6.42"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.42/meghnaad-hook-0.6.42-aarch64-apple-darwin.tar.gz"
      sha256 "900b23b34858e324229615237ebc34eb84fa5d0b77bec9160a8fd5998fb3ff61"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.42/meghnaad-hook-0.6.42-x86_64-apple-darwin.tar.gz"
      sha256 "c8e40b3a9dd5300e3ac3d2c350f3ec2729a253364701d5872162adad7e5f54d0"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.42/meghnaad-hook-0.6.42-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8c3fd519400db53d4654080873dd99182095cc08b6bb65d7e3cee9a2d50324e9"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.6.42/meghnaad-hook-0.6.42-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "627358476fa9e608902cda73d8c5c0b0f46b692012b600a41ec611daafca36a9"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.6.42/docs/using.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
